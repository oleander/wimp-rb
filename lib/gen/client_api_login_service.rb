#
# Autogenerated by Thrift Compiler (0.9.1)
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#

require 'thrift'
require 'services_types'

module WiMP
  module Gen
    module ClientApiLoginService
      class Client
        include ::Thrift::Client

        def getClientConfig(partnerUsername, partnerPassword, clientName)
          send_getClientConfig(partnerUsername, partnerPassword, clientName)
          return recv_getClientConfig()
        end

        def send_getClientConfig(partnerUsername, partnerPassword, clientName)
          send_message('getClientConfig', GetClientConfig_args, :partnerUsername => partnerUsername, :partnerPassword => partnerPassword, :clientName => clientName)
        end

        def recv_getClientConfig()
          result = receive_message(GetClientConfig_result)
          return result.success unless result.success.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'getClientConfig failed: unknown result')
        end

        def simpleLogin(userName, password, partnerUsername, partnerPassword, clientName, clientUniqueKey)
          send_simpleLogin(userName, password, partnerUsername, partnerPassword, clientName, clientUniqueKey)
          return recv_simpleLogin()
        end

        def send_simpleLogin(userName, password, partnerUsername, partnerPassword, clientName, clientUniqueKey)
          send_message('simpleLogin', SimpleLogin_args, :userName => userName, :password => password, :partnerUsername => partnerUsername, :partnerPassword => partnerPassword, :clientName => clientName, :clientUniqueKey => clientUniqueKey)
        end

        def recv_simpleLogin()
          result = receive_message(SimpleLogin_result)
          return result.success unless result.success.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'simpleLogin failed: unknown result')
        end

        def recoverPassword(userName, partnerUsername, partnerPassword)
          send_recoverPassword(userName, partnerUsername, partnerPassword)
          return recv_recoverPassword()
        end

        def send_recoverPassword(userName, partnerUsername, partnerPassword)
          send_message('recoverPassword', RecoverPassword_args, :userName => userName, :partnerUsername => partnerUsername, :partnerPassword => partnerPassword)
        end

        def recv_recoverPassword()
          result = receive_message(RecoverPassword_result)
          return result.success unless result.success.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'recoverPassword failed: unknown result')
        end

        def loginWithToken(userName, password, partnerUsername, partnerPassword, clientName)
          send_loginWithToken(userName, password, partnerUsername, partnerPassword, clientName)
          return recv_loginWithToken()
        end

        def send_loginWithToken(userName, password, partnerUsername, partnerPassword, clientName)
          send_message('loginWithToken', LoginWithToken_args, :userName => userName, :password => password, :partnerUsername => partnerUsername, :partnerPassword => partnerPassword, :clientName => clientName)
        end

        def recv_loginWithToken()
          result = receive_message(LoginWithToken_result)
          return result.success unless result.success.nil?
          raise ::Thrift::ApplicationException.new(::Thrift::ApplicationException::MISSING_RESULT, 'loginWithToken failed: unknown result')
        end

      end

      class Processor
        include ::Thrift::Processor

        def process_getClientConfig(seqid, iprot, oprot)
          args = read_args(iprot, GetClientConfig_args)
          result = GetClientConfig_result.new()
          result.success = @handler.getClientConfig(args.partnerUsername, args.partnerPassword, args.clientName)
          write_result(result, oprot, 'getClientConfig', seqid)
        end

        def process_simpleLogin(seqid, iprot, oprot)
          args = read_args(iprot, SimpleLogin_args)
          result = SimpleLogin_result.new()
          result.success = @handler.simpleLogin(args.userName, args.password, args.partnerUsername, args.partnerPassword, args.clientName, args.clientUniqueKey)
          write_result(result, oprot, 'simpleLogin', seqid)
        end

        def process_recoverPassword(seqid, iprot, oprot)
          args = read_args(iprot, RecoverPassword_args)
          result = RecoverPassword_result.new()
          result.success = @handler.recoverPassword(args.userName, args.partnerUsername, args.partnerPassword)
          write_result(result, oprot, 'recoverPassword', seqid)
        end

        def process_loginWithToken(seqid, iprot, oprot)
          args = read_args(iprot, LoginWithToken_args)
          result = LoginWithToken_result.new()
          result.success = @handler.loginWithToken(args.userName, args.password, args.partnerUsername, args.partnerPassword, args.clientName)
          write_result(result, oprot, 'loginWithToken', seqid)
        end

      end

      # HELPER FUNCTIONS AND STRUCTURES

      class GetClientConfig_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        PARTNERUSERNAME = 1
        PARTNERPASSWORD = 2
        CLIENTNAME = 3

        FIELDS = {
          PARTNERUSERNAME => {:type => ::Thrift::Types::STRING, :name => 'partnerUsername'},
          PARTNERPASSWORD => {:type => ::Thrift::Types::STRING, :name => 'partnerPassword'},
          CLIENTNAME => {:type => ::Thrift::Types::STRING, :name => 'clientName'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class GetClientConfig_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0

        FIELDS = {
          SUCCESS => {:type => ::Thrift::Types::MAP, :name => 'success', :key => {:type => ::Thrift::Types::STRING}, :value => {:type => ::Thrift::Types::STRING}}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class SimpleLogin_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        USERNAME = 1
        PASSWORD = 2
        PARTNERUSERNAME = 3
        PARTNERPASSWORD = 4
        CLIENTNAME = 5
        CLIENTUNIQUEKEY = 6

        FIELDS = {
          USERNAME => {:type => ::Thrift::Types::STRING, :name => 'userName'},
          PASSWORD => {:type => ::Thrift::Types::STRING, :name => 'password'},
          PARTNERUSERNAME => {:type => ::Thrift::Types::STRING, :name => 'partnerUsername'},
          PARTNERPASSWORD => {:type => ::Thrift::Types::STRING, :name => 'partnerPassword'},
          CLIENTNAME => {:type => ::Thrift::Types::STRING, :name => 'clientName'},
          CLIENTUNIQUEKEY => {:type => ::Thrift::Types::STRING, :name => 'clientUniqueKey'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class SimpleLogin_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0

        FIELDS = {
          SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::WiMP::Gen::Profile}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class RecoverPassword_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        USERNAME = 1
        PARTNERUSERNAME = 2
        PARTNERPASSWORD = 3

        FIELDS = {
          USERNAME => {:type => ::Thrift::Types::STRING, :name => 'userName'},
          PARTNERUSERNAME => {:type => ::Thrift::Types::STRING, :name => 'partnerUsername'},
          PARTNERPASSWORD => {:type => ::Thrift::Types::STRING, :name => 'partnerPassword'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class RecoverPassword_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0

        FIELDS = {
          SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::WiMP::Gen::Profile}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class LoginWithToken_args
        include ::Thrift::Struct, ::Thrift::Struct_Union
        USERNAME = 1
        PASSWORD = 2
        PARTNERUSERNAME = 3
        PARTNERPASSWORD = 4
        CLIENTNAME = 5

        FIELDS = {
          USERNAME => {:type => ::Thrift::Types::STRING, :name => 'userName'},
          PASSWORD => {:type => ::Thrift::Types::STRING, :name => 'password'},
          PARTNERUSERNAME => {:type => ::Thrift::Types::STRING, :name => 'partnerUsername'},
          PARTNERPASSWORD => {:type => ::Thrift::Types::STRING, :name => 'partnerPassword'},
          CLIENTNAME => {:type => ::Thrift::Types::STRING, :name => 'clientName'}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

      class LoginWithToken_result
        include ::Thrift::Struct, ::Thrift::Struct_Union
        SUCCESS = 0

        FIELDS = {
          SUCCESS => {:type => ::Thrift::Types::STRUCT, :name => 'success', :class => ::WiMP::Gen::Profile}
        }

        def struct_fields; FIELDS; end

        def validate
        end

        ::Thrift::Struct.generate_accessors self
      end

    end

  end
end