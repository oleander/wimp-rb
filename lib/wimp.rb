$:.push('./lib/gen')
require "gen/client_api_login_service"
require "gen/client_api_service"
require "wimp/version"
require "wimp/error"
require "wimp/base"
require "wimp/track"

module WiMP
  class << self
    attr_accessor :configuration
  end

  def self.configure
    yield(configuration)
  end

  class Configuration
    P_USERNAME       = "wimpse"
    P_PASSWORD       = "slbh4UUgH"
    D_CLIENT_NAME    = "Android_WIMP-2.5.2.se"
    D_CLIENT_ID      = "8263371084"
    SECURE_LOGIN_URL = "https://client.wimpmusic.com/clientapi/servicelogin"

    attr_accessor :username, :password, :client_name, :client_id

    #
    # @return String
    #
    def session
      @_session ||= begin
        transport = Thrift::HTTPClientTransport.new(SECURE_LOGIN_URL)
        protocol = Thrift::BinaryProtocol.new(transport)
        client = Gen::ClientApiLoginService::Client.new(protocol)
        transport.open
        result = client.simpleLogin(
          username,
          password,
          P_USERNAME,
          P_PASSWORD,
          client_name || D_CLIENT_NAME,
          client_id || D_CLIENT_ID
        )
        transport.close
        result.sessionId
      end
    rescue Thrift::ApplicationException
      raise LoginFailed.new("Login failed, invalid credentials. Are you really a premium user?")
    end

    #
    # @return Boolean
    #
    def logged_in?
      !! session
    end

    def logout!
      @_session = nil
    end
  end

  self.configuration ||= Configuration.new
end
