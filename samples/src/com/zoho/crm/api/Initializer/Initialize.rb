require 'ZOHOCRMSDK2_1'
class Initialize
  def self.Initialize
    log = ZOHOCRMSDK::SDKLog::Log.initialize(level:ZOHOCRMSDK::Levels::INFO, path:'/Users/Documents/file/ruby.log')
    tokenstore = ZOHOCRMSDK::Store::FileStore.new('/Users/Documents/file/tokens.txt')
    token =  ZOHOCRMSDK::Authenticator::OAuthToken.new(client_id:"1.xxxx", client_secret:"xxxx", refresh_token:"1.xxx.xxx", redirect_url:"https://www.zoho.com")
    user = ZOHOCRMSDK::UserSignature.new('abc@zohocorp.com')
    environment = ZOHOCRMSDK::DC::USDataCenter::PRODUCTION
    sdk_config = ZOHOCRMSDK::SDKConfig.new(auto_refresh_fields: false, pick_list_validation: true)# open_timeout: 60, read_timeout: 60, write_timeout: 600)
    resource_path = '/Users/Documents/file/'
    ZOHOCRMSDK::Initializer.initialize(user: user, environment: environment, token: token, store: tokenstore, sdk_config: sdk_config, log: log, resources_path: resource_path)
  end
end
