require 'ZCRMSDK'
module MultiUser
  class MultiThreading
    def initialize(module_api_name)
      @module_api_name = module_api_name
    end

    def execute
      log = SDKLog::Log.initialize(Levels::INFO, '/Users/user_name/Documents/rubysdk_log.log')
      user_signature = UserSignature.new('abc@zohocorp.com')
      environment = DC::USDataCenter::PRODUCTION
      token = Authenticator::OAuthToken.new("clientId", "clientSecret", "REFRESH/GRANT token", TokenType::REFRESH/GRANT, "redirectURL")
      tokenstore = Store::FileStore.new('/Users/user_name/RUBYWS/zohocrm-rubysdk-sample-application/tokens.txt')
      sdk_config = SDKConfig::Builder.new.auto_refresh_fields(false).pick_list_validation(true).build
      proxy = RequestProxy.new('proxyHost', 'proxyPort', 'proxyUser', 'password')
      module_api_name = 'Leads'
      resources_path = '/Users/user_name/RUBYWS'
      Initializer.initialize(user_signature, environment, token, tokenstore, sdk_config, resources_path, log,proxy)
      t1 = Thread.new{ func1 }
      t2 = Thread.new{ func1 }
      t1.join
      t2.join
    end

    def func1
      ro = Record::RecordOperations.new
      ro.get_records(@module_api_name,nil,nil)
    end
  end
end

