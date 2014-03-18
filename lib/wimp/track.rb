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
    # @return RecordLabel
    #
    def record_label
      @o.recordLabel
    end

    #
    # @return Integer
    #
    def sales_price_rule_id
      @o.salesPriceRuleId
    end

    #
    # @return Integer
    #
    def popularity_level
      @o.popularityLevel
    end

    #
    # @return Boolean
    #
    def premium_only_streaming?
      @o.premiumOnlyStreaming
    end

    #
    # @return Boolean
    #
    def allow_streaming?
      @o.allowStreaming
    end

    #
    # @return Boolean
    #
    def album_broken?
      @o.albumBroken
    end

    #
    # @return Boolean
    #
    def album_only?
      @o.albumOnly
    end

    #
    # @return Boolean
    #
    def stream_ready?
      @o.streamReady
    end

    #
    # @return Boolean
    #
    def sales_ready?
      @o.salesReady
    end

    #
    # @return Date
    #
    def stream_started_at
      Time.at(@o.streamStartDate.to_f / 1000).to_datetime
    end

    #
    # @return Date
    #
    def sales_started_at
      Time.at(@o.salesStartDate.to_f / 1000).to_datetime
    end

    #
    # @return Float
    #
    def price
      @o.price
    end

    #
    # @return Float
    #
    def search_score
      @o.searchScore
    end

    #
    # @return Integer
    #
    def popularity_this_week
      @o.popularityThisWeek
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
    def album_nr_of_volumes
      @o.albumNrOfVolumes
    end

    #
    # @return Integer
    #
    def track_number
      @o.trackNumber
    end

    #
    # @return Integer
    #
    def volume_number
      @o.volumeNumber
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
    def revised_copyright
      @o.revisedCopyright
    end

    #
    # @return String
    #
    def customizable_album_cover
      @o.customizableAlbumCover
    end

    #
    # @return String
    #
    def preview_url
      @o.previewURL
    end

    #
    # @return String
    #
    def album_calculated_type
      @o.albumCalculatedType
    end

    #
    # @return String
    #
    def price_code
      @o.priceCode
    end

    #
    # @return String
    #
    def currency_code
      @o.currencyCode
    end

    #
    # @return String
    #
    def version
      @o.version
    end

    #
    # @return String
    #
    def content_access_string
      @o.contentAccessString
    end

    #
    # @return String
    #
    def large_album_cover
      @o.largeAlbumCover
    end

    #
    # @return String
    #
    def medium_album_cover
      @o.mediumAlbumCover
    end

    #
    # @return String
    #
    def small_album_cover
      @o.smallAlbumCover
    end

    #
    # @return String
    #
    def copyright
      @o.copyright
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
  end
end