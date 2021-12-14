require 'ZOHOCRMSDK2_1'
module MultiUser
  class SingleThreading
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
      func1(user, environment, token, sdk_config)
    end

    def func1(user, environment, token, sdk_config)
      ZOHOCRMSDK::Initializer.switch_user(user:user, environment:environment, token:token, sdk_config:sdk_config)
      print ZOHOCRMSDK::Initializer.get_initializer.user.email
      # Get instance of RecordOperations Class
      ro = ZOHOCRMSDK::Record::RecordOperations.new
      rersponse = ro.get_records(@module_api_name,nil,nil)
      print "\n\n\n"
      print rersponse.data_object.inspect
    end
  end
end
