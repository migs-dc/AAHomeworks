class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

  def better_tracks_query
    albums = self
      .select('albums.*, COUNT(*) AS track_count')
      .joins(:tracks)
      .group(:album.id)

    album_track_counts = {}
    albums.each do |album|
        album_track_counts[album.title] = album.track_count
    end

    album_track_counts
  end

  # def better_tracks_query
  #   #Count all of the tracks on each album by a given artist.
  #   albums = self.albums.includes(:tracks)

  #   album_track_counts = {}
  #   albums.each do |album|
  #     album_track_counts[album] = album.tracks.length
  #   end

  #   album_track_counts
  # end
end
