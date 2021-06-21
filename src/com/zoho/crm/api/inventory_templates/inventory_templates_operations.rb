require_relative '../param'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module InventoryTemplates
  class InventoryTemplatesOperations

      # Creates an instance of InventoryTemplatesOperations with the given parameters
      # @param module_1 [String] A String
      # @param sort_by [String] A String
      # @param sort_order [String] A String
      # @param category [String] A String
    def initialize(module_1=nil, sort_by=nil, sort_order=nil, category=nil)
      if module_1!=nil and !module_1.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: module_1 EXPECTED TYPE: String', nil, nil)
      end
      if sort_by!=nil and !sort_by.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sort_by EXPECTED TYPE: String', nil, nil)
      end
      if sort_order!=nil and !sort_order.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sort_order EXPECTED TYPE: String', nil, nil)
      end
      if category!=nil and !category.is_a? String
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: category EXPECTED TYPE: String', nil, nil)
      end
      @module_1 = module_1
      @sort_by = sort_by
      @sort_order = sort_order
      @category = category
    end

      # The method to get inventory templates
      # @return An instance of APIResponse
    # @raise SDKException
    def get_inventory_templates
      handler_instance = Handler::CommonAPIHandler.new
      api_path = ''
      api_path = api_path + '/crm/v2.1/settings/inventory_templates'
      handler_instance.api_path = api_path
      handler_instance.http_method = Constants::REQUEST_METHOD_GET
      handler_instance.category_method = 'READ'
      handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @module_1)
      handler_instance.add_param(Param.new('sort_by', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @sort_by)
      handler_instance.add_param(Param.new('sort_order', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @sort_order)
      handler_instance.add_param(Param.new('category', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @category)
      require_relative 'response_handler'
      handler_instance.api_call(ResponseHandler.name, 'application/json')
    end

      # The method to get inventory template by id
      # @param id [Integer] A Integer
      # @return An instance of APIResponse
    # @raise SDKException
    def get_inventory_template_by_id(id)
      if !id.is_a? Integer
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
      end
      handler_instance = Handler::CommonAPIHandler.new
      api_path = ''
      api_path = api_path + '/crm/v2.1/settings/inventory_templates/'
      api_path = api_path + id.to_s
      handler_instance.api_path = api_path
      handler_instance.http_method = Constants::REQUEST_METHOD_GET
      handler_instance.category_method = 'READ'
      handler_instance.add_param(Param.new('module', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @module_1)
      handler_instance.add_param(Param.new('sort_by', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @sort_by)
      handler_instance.add_param(Param.new('sort_order', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @sort_order)
      handler_instance.add_param(Param.new('category', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @category)
      require_relative 'response_handler'
      handler_instance.api_call(ResponseHandler.name, 'application/json')
    end

    class GetInventoryTemplatesParam
    end

    class GetInventoryTemplatebyIDParam
    end

  end
end
