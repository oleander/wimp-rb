module WiMP
  class Playlist < Base
    def initialize(oplaylist)
      @o = oplaylist
      @tracks = (@o.tracks || []).map{|track| Track.new(track)}
    end

    #
    # @title String
    # @return Playlist
    #
    def self.create(title)
      execute do |client|
        new(client.addUserPlaylist(title, session))
      end
    end

    #
    # @uuid String
    # @return Playlist
    #
    def self.find(uuid)
      execute do |client|
        new(client.getUserPlaylistByUuid(uuid, session))
      end
    end

    #
    # @tracks Array<Track> Tracks to be added
    # @options[start_position] Integer Where 
    #   should the new tracks be added?
    # @return Boolean Were the request sucessful?
    #
    def add_tracks(tracks, options = {})
      add_tracks_by_id(tracks.map(&:id), options)
    end

    #
    # @tracks Array<Integer> A list of Track#id
    # @options[start_position] Integer Where 
    #   should the new tracks be added?
    # @return Boolean Were the request sucessful?
    #
    def add_tracks_by_id(track_ids, options = {})
      execute do |client|
        client.addTracksToUserPlaylist(
          uuid,
          track_ids,
          options.fetch(:start_position, 0),
          session
        )
      end
    end

    #
    # @indices Array<Integer> Track positions
    # @return Boolean Were the request successfull?
    #
    def remove_tracks_by_indices(indices)
      execute do |client|
        client.removeUserPlaylistTracks(uuid, indices, session)
      end
    end

    #
    # @return String
    #
    def url
      "http://wimpmusic.se/playlist/#{uuid}"
    end

    #
    # @return String
    #
    def uuid
      @o.uuid
    end

    #
    # @return Array<Track>
    #
    def tracks
      @tracks
    end

    #
    # @return Integer
    #
    def count
      @o.count
    end
  end
end