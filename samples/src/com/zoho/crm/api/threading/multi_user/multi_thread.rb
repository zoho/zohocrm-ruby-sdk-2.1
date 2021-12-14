require 'ZOHOCRMSDK2_1'
module MultiUser
  class MultiThreading
    def initialize(module_api_name)
      @module_api_name = module_api_name
    end

    def execute
      log = ZOHOCRMSDK::SDKLog::Log.initialize(level:ZOHOCRMSDK::Levels::INFO, path:'/Users/username/Documents/ruby.log')
      tokenstore = ZOHOCRMSDK::Store::FileStore.new('/Users/username/Documentstokens.txt')
      token =  ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"1.xxx", client_secret:"xxxx", refresh_token:"1.xxx.xxx", redirect_url:"https://www.zoho.com")
      user = ZOHOCRMSDK::UserSignature.new('abc@zohocorp.com')
      environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
      sdk_config = ZOHOCRMSDK::SDKConfig.new(auto_refresh_fields: false, pick_list_validation: true)# open_timeout: 60, read_timeout: 60, write_timeout: 600)
      resource_path = '/Users/username/Documents/'
      ZOHOCRMSDK::Initializer.initialize(user: user, environment: environment, token: token, store: tokenstore, sdk_config: sdk_config, log: log, resources_path: resource_path)
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

