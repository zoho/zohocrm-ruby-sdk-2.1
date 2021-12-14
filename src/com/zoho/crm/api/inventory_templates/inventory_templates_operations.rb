require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module InventoryTemplates
    class InventoryTemplatesOperations

        # Creates an instance of InventoryTemplatesOperations with the given parameters
        # @param sort_by [String] A String
        # @param sort_order [String] A String
        # @param category [String] A String
      def initialize(sort_by=nil, sort_order=nil, category=nil)
        if sort_by!=nil and !sort_by.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sort_by EXPECTED TYPE: String', nil, nil)
        end
        if sort_order!=nil and !sort_order.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sort_order EXPECTED TYPE: String', nil, nil)
        end
        if category!=nil and !category.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: category EXPECTED TYPE: String', nil, nil)
        end
        @sort_by = sort_by
        @sort_order = sort_order
        @category = category
      end

        # The method to get inventory templates
        # @param param_instance [ParameterMap] An instance of ParameterMap
        # @return An instance of APIResponse
      # @raise SDKException
      def get_inventory_templates(param_instance=nil)
        if param_instance!=nil and !param_instance.is_a? ParameterMap
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/inventory_templates'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('sort_by', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @sort_by)
        handler_instance.add_param(Param.new('sort_order', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @sort_order)
        handler_instance.add_param(Param.new('category', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam'), @category)
        handler_instance.param = param_instance
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
        handler_instance.add_param(Param.new('sort_by', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @sort_by)
        handler_instance.add_param(Param.new('sort_order', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @sort_order)
        handler_instance.add_param(Param.new('category', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatebyIDParam'), @category)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

      class GetInventoryTemplatesParam
          @@module_1 =   Param.new('module', 'com.zoho.crm.api.InventoryTemplates.GetInventoryTemplatesParam')
        def self.module_1
          @@module_1
        end
      end

      class GetInventoryTemplatebyIDParam
      end

    end
  end
end
