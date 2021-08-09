require 'ZCRMSDK'
class Initialize
  def self.Initialize
    log = SDKLog::Log.initialize(level: Levels::ALL, path: '/Users/Documents/sdk.log')
    
    dbstore = Store::FileStore.new('/Users/Documents/tokens.txt')
    
    token =  Authenticator::OAuthToken.new(client_id:"1000.xxxx", client_secret: "xxxx", grant_token:"1000.xxxxx.xxxxx")
    
    user = UserSignature.new('abc@zoho.com')
    
    environment = DC::USDataCenter::PRODUCTION

    sdk_config = SDKConfig.new(auto_refresh_fields: true, pick_list_validation: true, open_timeout: 60, read_timeout: 60, write_timeout: 60, keep_alive_timeout: 2)
    
    resource_path = '/Users/Documents'
    
    Initializer.initialize(user: user, environment: environment, token: token, store: dbstore, sdk_config: sdk_config, resources_path: resource_path, log: log)
  rescue Exception => ex
    print ex.inspect
  end
end
