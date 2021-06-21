require 'ZCRMSDK'
module MultiUser
  class SingleThreading
    def initialize(module_api_name)
      @module_api_name = module_api_name
    end

    def execute
      log = SDKLog::Log.initialize(Levels::INFO, '/Users/user_name/RUBYWS/zohocrm-rubysdk-sample-application/sdk.log')
      dbstore = Store::FileStore.new('/Users/user_name/RUBYWS/zohocrm-rubysdk-sample-application/tokens.txt')
      token =  Authenticator::OAuthToken.new("clientId", "clientSecret", "REFRESH/GRANT token", TokenType::REFRESH/GRANT, "redirectURL")
      user = UserSignature.new('adsdssas.a@zohocorp.com')
      environment = DC::USDataCenter::PRODUCTION   
      sdk_config = SDKConfig::Builder.new.auto_refresh_fields(false).pick_list_validation(true).build
      func1(user, environment, token, sdk_config)
    end

    def func1(user, environment, token, sdk_config)   
      Initializer.switch_user(user, environment, token, sdk_config)
      print Initializer.get_initializer.user.email
      # Get instance of RecordOperations Class
      ro = Record::RecordOperations.new
      rersponse = ro.get_records(@module_api_name,nil,nil)
      print "\n\n\n"
      print rersponse.data_object.inspect
    end
  end
end
