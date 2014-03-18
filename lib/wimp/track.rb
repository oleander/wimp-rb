require "time"

module WiMP
  class Track < Base
    #
    # @query String
    # @options[limit] Integer
    #
    # @return Array<Track>
    #
    def self.search(query, options =  {})
      execute do |client|
        client.search(
          query, 0, 0, 
          options.fetch(:limit, 10), 
          WiMP.configuration.session, 0
        ).tracks.map {|track| WiMP::Track.new(track)}
      end
    end

    #
    # @return String
    #
    def url
      "http://wimpmusic.se/track/#{id}"
    end

    #
    # @return Integer
    #
    def popularity
      @o.popularity
    end

    #
    # @return Integer
    #
    def id
      @o.id
    end

    #
    # @return Integer
    #
    def duration
      @o.duration
    end

    #
    # @return Integer
    #
    def album_id
      @o.albumId
    end

    #
    # @return Integer
    #
    def artist_id
      @o.artistId
    end

    #
    # @return String
    #
    def album
      @o.album
    end

    #
    # @return String
    #
    def artist
      @o.artist
    end

    #
    # @return String
    #
    def title
      @o.title
    end

    #
    # @return SimpleArtist
    #
    def artist
      @_artist ||= SimpleArtist.new(@o.artist, artist_id)
    end
  end
end