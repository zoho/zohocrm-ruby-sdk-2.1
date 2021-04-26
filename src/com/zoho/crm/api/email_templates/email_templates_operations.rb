require_relative '../param'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module EmailTemplates
  class EmailTemplatesOperations

      # Creates an instance of EmailTemplatesOperations with the given parameters
      # @param module_1 [String] A String
    def initialize(module_1=nil)
      if module_1!=nil and !module_1.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
      end
      @module_1 = module_1
    end

      # The method to get email templates
      # @return An instance of APIResponse
    # @raise SDKException
    def get_email_templates
      handler_instance = Handler::CommonAPIHandler.new
      api_path = ''
      api_path = api_path + '/crm/v2.1/settings/email_templates'
      handler_instance.api_path = api_path
      handler_instance.http_method = Constants::REQUEST_METHOD_GET
      handler_instance.category_method = 'READ'
      handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.EmailTemplates.GetEmailTemplatesParam'), @module_1)
      require_relative 'response_handler'
      handler_instance.api_call(ResponseHandler.name, 'application/json')
    end

      # The method to get email template by id
      # @param id [Integer] A Integer
      # @return An instance of APIResponse
    # @raise SDKException
    def get_email_template_by_id(id)
      if !id.is_a? Integer
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
      end
      handler_instance = Handler::CommonAPIHandler.new
      api_path = ''
      api_path = api_path + '/crm/v2.1/settings/email_templates/'
      api_path = api_path + id.to_s
      handler_instance.api_path = api_path
      handler_instance.http_method = Constants::REQUEST_METHOD_GET
      handler_instance.category_method = 'READ'
      handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.EmailTemplates.GetEmailTemplatebyIDParam'), @module_1)
      require_relative 'response_handler'
      handler_instance.api_call(ResponseHandler.name, 'application/json')
    end

    class GetEmailTemplatesParam
    end

    class GetEmailTemplatebyIDParam
    end

  end
end
