require_relative '../param'
require_relative '../exception/sdk_exception'
require_relative '../util/api_response'
require_relative '../util/common_api_handler'
require_relative '../util/constants'

module ZOHOCRMSDK
  module Pipeline
    class PipelineOperations

        # Creates an instance of PipelineOperations with the given parameters
        # @param layout_id [Integer] A Integer
      def initialize(layout_id=nil)
        if layout_id!=nil and !layout_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: layout_id EXPECTED TYPE: Integer', nil, nil)
        end
        @layout_id = layout_id
      end

        # The method to transfer and delete
        # @param request [TransferAndDeleteWrapper] An instance of TransferAndDeleteWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def transfer_and_delete(request)
        if request!=nil and !request.is_a? TransferAndDeleteWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: TransferAndDeleteWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/pipeline/actions/transfer'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.add_param(Param.new('layout_id', 'com.zoho.crm.api.Pipeline.TransferAndDeleteParam'), @layout_id)
        require_relative 'transfer_action_handler'
        handler_instance.api_call(TransferActionHandler.name, 'application/json')
      end

        # The method to get pipelines
        # @return An instance of APIResponse
      # @raise SDKException
      def get_pipelines
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/pipeline'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('layout_id', 'com.zoho.crm.api.Pipeline.GetPipelinesParam'), @layout_id)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to create pipelines
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def create_pipelines(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/pipeline'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_POST
        handler_instance.category_method = 'CREATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.add_param(Param.new('layout_id', 'com.zoho.crm.api.Pipeline.CreatePipelinesParam'), @layout_id)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to update pipelines
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_pipelines(request)
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/pipeline'
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.mandatory_checker = true
        handler_instance.add_param(Param.new('layout_id', 'com.zoho.crm.api.Pipeline.UpdatePipelinesParam'), @layout_id)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

        # The method to get pipeline
        # @param pipeline_id [Integer] A Integer
        # @return An instance of APIResponse
      # @raise SDKException
      def get_pipeline(pipeline_id)
        if !pipeline_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: pipeline_id EXPECTED TYPE: Integer', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/pipeline/'
        api_path = api_path + pipeline_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_GET
        handler_instance.category_method = 'READ'
        handler_instance.add_param(Param.new('layout_id', 'com.zoho.crm.api.Pipeline.GetPipelineParam'), @layout_id)
        require_relative 'response_handler'
        handler_instance.api_call(ResponseHandler.name, 'application/json')
      end

        # The method to update pipeline
        # @param pipeline_id [Integer] A Integer
        # @param request [BodyWrapper] An instance of BodyWrapper
        # @return An instance of APIResponse
      # @raise SDKException
      def update_pipeline(pipeline_id, request)
        if !pipeline_id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: pipeline_id EXPECTED TYPE: Integer', nil, nil)
        end
        if request!=nil and !request.is_a? BodyWrapper
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: request EXPECTED TYPE: BodyWrapper', nil, nil)
        end
        handler_instance = Handler::CommonAPIHandler.new
        api_path = ''
        api_path = api_path + '/crm/v2.1/settings/pipeline/'
        api_path = api_path + pipeline_id.to_s
        handler_instance.api_path = api_path
        handler_instance.http_method = Constants::REQUEST_METHOD_PUT
        handler_instance.category_method = 'UPDATE'
        handler_instance.content_type = 'application/json'
        handler_instance.request = request
        handler_instance.add_param(Param.new('layout_id', 'com.zoho.crm.api.Pipeline.UpdatePipelineParam'), @layout_id)
        require_relative 'action_handler'
        handler_instance.api_call(ActionHandler.name, 'application/json')
      end

      class TransferAndDeleteParam
      end

      class GetPipelinesParam
      end

      class CreatePipelinesParam
      end

      class UpdatePipelinesParam
      end

      class GetPipelineParam
      end

      class UpdatePipelineParam
      end

    end
  end
end
