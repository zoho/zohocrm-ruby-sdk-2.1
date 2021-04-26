require_relative '../param'
require_relative '../parameter_map'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module AssignmentRules
  class AssignmentRulesOperations

    # Creates an instance of AssignmentRulesOperations
    def initialize
    end

      # The method to get assignment rules
      # @return An instance of APIResponse
    # @raise SDKException
    def get_assignment_rules
      handler_instance = Handler::CommonAPIHandler.new
      api_path = ''
      api_path = api_path + '/crm/v2.1/settings/automation/assignment_rules'
      handler_instance.api_path = api_path
      handler_instance.http_method = Constants::REQUEST_METHOD_GET
      handler_instance.category_method = 'READ'
      require_relative 'response_handler'
      handler_instance.api_call(ResponseHandler.name, 'application/json')
    end

      # The method to get assignment rule
      # @param rule_id [Integer] A Integer
      # @param param_instance [ParameterMap] An instance of ParameterMap
      # @return An instance of APIResponse
    # @raise SDKException
    def get_assignment_rule(rule_id, param_instance=nil)
      if !rule_id.is_a? Integer
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: rule_id EXPECTED TYPE: Integer', nil, nil)
      end
      if param_instance!=nil and !param_instance.is_a? ParameterMap
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: param_instance EXPECTED TYPE: ParameterMap', nil, nil)
      end
      handler_instance = Handler::CommonAPIHandler.new
      api_path = ''
      api_path = api_path + '/crm/v2.1/settings/automation/assignment_rules/'
      api_path = api_path + rule_id.to_s
      handler_instance.api_path = api_path
      handler_instance.http_method = Constants::REQUEST_METHOD_GET
      handler_instance.category_method = 'READ'
      handler_instance.param = param_instance
      require_relative 'response_handler'
      handler_instance.api_call(ResponseHandler.name, 'application/json')
    end

    class GetAssignmentRuleParam
      @@module_1 = Param.new('module', 'com.zoho.crm.api.AssignmentRules.GetAssignmentRuleParam')
      def self.module_1
        @@module_1
      end
    end

  end
end