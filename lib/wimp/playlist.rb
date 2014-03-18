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
      execute do |client|
        client.addTracksToUserPlaylist(
          uuid,
          tracks.map(&:id),
          options.fetch(:start_position),
          WiMP.configuration.session
        )
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