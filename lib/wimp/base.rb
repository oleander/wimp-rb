module WiMP
  class Base
    @@transport = Thrift::HTTPClientTransport.new("http://client.wimpmusic.com/clientapi/service")
    @@protocol = Thrift::BinaryProtocol.new(@@transport)
    @@client = Gen::ClientApiService::Client.new(@@protocol)

    def initialize(orginal)
      @o = orginal
    end

    def self.execute(&block)
      @@transport.open
      result = block.call(@@client)
      @@transport.close
      result
    end

    def execute(&block)
      Base.execute(&block)
    end
  end
end