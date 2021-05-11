class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @current_player_name = name1
    @cups = Array.new(14) { Array.new }
    place_stones

  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..5).each do |i|
      @cups[i]= [:stone, :stone, :stone, :stone]
      @cups[i+7]= [:stone, :stone, :stone, :stone]
    end
  end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if !(0..13).to_a.include?(start_pos)
    raise 'Starting cup is empty' if @cups[start_pos] == []
  end

  def make_move(start_pos, current_player_name)
    @cups[start_pos]= []
    i = 0
    # (start_pos.between?(1,6) && @side != 1 ||
    #     start_pos.between?(7,12) && @side != 2)
    until @cups[start_pos] == []
      if (start_pos+i) != 13 || (start_pos+i) != 6
        @cups[start_pos+i] << @cups[start_pos].pop
      end
      i += 1
    end
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
