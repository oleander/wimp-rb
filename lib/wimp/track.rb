require "time"

module WiMP
  class Track
    def initialize(otrack)
      @otrack = otrack
    end

    #
    # @query String
    # @options[limit] Integer
    #
    # @return Array<Track>
    #
    def self.search(query, options)
      
    end

    #
    # @return RecordLabel
    #
    def record_label
      @otrack.recordLabel
    end

    #
    # @return Integer
    #
    def sales_price_rule_id
      @otrack.salesPriceRuleId
    end

    #
    # @return Integer
    #
    def popularity_level
      @otrack.popularityLevel
    end

    #
    # @return Boolean
    #
    def premium_only_streaming?
      @otrack.premiumOnlyStreaming
    end

    #
    # @return Boolean
    #
    def allow_streaming?
      @otrack.allowStreaming
    end

    #
    # @return Boolean
    #
    def album_broken?
      @otrack.albumBroken
    end

    #
    # @return Boolean
    #
    def album_only?
      @otrack.albumOnly
    end

    #
    # @return Boolean
    #
    def stream_ready?
      @otrack.streamReady
    end

    #
    # @return Boolean
    #
    def sales_ready?
      @otrack.salesReady
    end

    #
    # @return Date
    #
    def stream_started_at
      Time.at(@otrack.streamStartAt).to_datetime
    end

    #
    # @return Date
    #
    def sales_started_at
      Time.at(@otrack.salesStartAt).to_datetime
    end

    #
    # @return Float
    #
    def price
      @otrack.price
    end

    #
    # @return Float
    #
    def search_score
      @otrack.searchScore
    end

    #
    # @return Integer
    #
    def popularity_this_week
      @otrack.popularityThisWeek
    end

    #
    # @return Integer
    #
    def popularity
      @otrack.popularity
    end

    #
    # @return Integer
    #
    def album_nr_of_volumes
      @otrack.albumNrOfVolumes
    end

    #
    # @return Integer
    #
    def track_number
      @otrack.trackNumber
    end

    #
    # @return Integer
    #
    def volume_number
      @otrack.volumeNumber
    end

    #
    # @return Integer
    #
    def id
      @otrack.id
    end

    #
    # @return Integer
    #
    def duration
      @otrack.duration
    end

    #
    # @return Integer
    #
    def album_id
      @otrack.albumId
    end

    #
    # @return Integer
    #
    def artist_id
      @otrack.artistId
    end

    #
    # @return String
    #
    def revised_copyright
      @otrack.revisedCopyright
    end

    #
    # @return String
    #
    def customizable_album_cover
      @otrack.customizableAlbumCover
    end

    #
    # @return String
    #
    def preview_url
      @otrack.previewURL
    end

    #
    # @return String
    #
    def album_calculated_type
      @otrack.albumCalculatedType
    end

    #
    # @return String
    #
    def price_code
      @otrack.priceCode
    end

    #
    # @return String
    #
    def currency_code
      @otrack.currencyCode
    end

    #
    # @return String
    #
    def version
      @otrack.version
    end

    #
    # @return String
    #
    def content_access_string
      @otrack.contentAccessString
    end

    #
    # @return String
    #
    def large_album_cover
      @otrack.largeAlbumCover
    end

    #
    # @return String
    #
    def medium_album_cover
      @otrack.mediumAlbumCover
    end

    #
    # @return String
    #
    def small_album_cover
      @otrack.smallAlbumCover
    end

    #
    # @return String
    #
    def copyright
      @otrack.copyright
    end

    #
    # @return String
    #
    def album
      @otrack.album
    end

    #
    # @return String
    #
    def artist
      @otrack.artist
    end
  end
end