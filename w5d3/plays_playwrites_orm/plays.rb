require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :id, :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def self.find_by_title(title)
    play = PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT
        *
      FROM 
        plays
      WHERE
        title = ?
    SQL
    return nil if play.length < 0

    Play.new(play.first)
  end

  def self.find_by_playwrite(name)
    plays = PlayDBConnection.instance.execute(<<-SQL, playwrite.id)
      SELECT
        *
      FROM 
        plays
      WHERE
        playwrite_id = ?
    SQL

    plays.map { |play| Play.new(play) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execute(<<-SQL, self.title, self.year, self.playwright_id, self.id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end
end


class Playwrite

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM playwrites")
    data.map { |datum| Playwrite.new(datum) }
  end

  def self.find_by_name(name)
    play = PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT
        *
      FROM
        playwrites
      WHERE
        name = ?
    SQL
  end

  def initialize(options)
    @id = options['id']
    @name = options['name']
    @birth_year = options['birth_year']
  end

  def create
    raise "#{self} already in database" if self.id
    PlayDBConnection.instance.execute(<<-SQL, self.id, self.name, self.birth_year)
      INSERT INTO
        playwrites (id, name, birth_year)
      VALUES
        (? ? ?)
    SQL
    self.id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    PlayDBConnection.instance.execture(<<-SQL, self.id, self.name, self.birth_year)
      UPDATE
        playwrites
      SET
        id = ?, name = ?, birthyear = ?
      WHERE
        id = ?
    SQL
  end

  def get_plays
    raise "#{self} not in database" unless self.id
    plays = PlayDBConnection.instance.exectue(<<-SQL, self.id)
      SELECT
        *
      FROM
        plays
      WHERE
        playwrite_id = ?
    SQL
    plays.map { |play| Play.new(play) }
  end

end