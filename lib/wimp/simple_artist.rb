module WiMP
  class SimpleArtist < Struct.new(:name, :id)
    #
    # @return String
    #
    def url
      "http://wimpmusic.se/artist/#{id}"
    end
  end
end
