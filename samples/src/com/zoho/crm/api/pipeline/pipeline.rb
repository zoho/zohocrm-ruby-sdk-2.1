require 'ZOHOCRMSDK2_1'

class Pipelines
  def self.get_pipelines(layout_id)
    # """
    # This method is used to get all the pipelines and print the response.
    # """
    # Get instance of PipelineOperations Class
    po = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    # Call get_pipelines method
    response = po.get_pipelines
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        if response_handler.is_a? ZOHOCRMSDK::Pipeline::ResponseWrapper
          # Get the list of Pipeline instances
          pipelines = response_handler.pipeline
          pipelines.each do |pipeline|
            # Get the ID of each Pipeline
            print 'pipeline ID:'
            print pipeline.id.to_s
            # Get the Display value of each Pipeline
            print "\n pipeline Display value:"
            print pipeline.display_value
            # Get the Actual value of each Pipeline
            print "\n pipeline Actual value:"
            print pipeline.actual_value
            # Get the default of each Pipeline
            print "\n pipeline default:"
            print pipeline.default
            # Get the child available of each Pipeline
            print "\n pipeline child available:"
            print pipeline.child_available
            # Get the parent of each Pipeline
            parent = pipeline.parent
            if !parent.nil?
                print "\n pipeline parent id:"
                print parent.id
            end
            maps = pipeline.maps
            maps.each do |map|
                #Get PickListValue Actual Value
                print "\nPickListValue Actual Value"
                print map.actual_value
                #Get PickListValue delete
                print "\nPickListValue delete" 
                print map.delete
                #Get PickListValue Display Value
                print "\nPickListValue Display Value"
                print map.display_value
                forecast_category = map.forecast_category
                if !forecast_category.nil?
                    #Get Forecast Category Name
                    print "\nForecast Category Name" 
                    print forecast_category.name
                    #Get Forecast Category id
                    print "\nForecast Category ID"
                    print forecast_category.id
                end
             
                #Get PickListValue Forecast type
                print "\nPickListValue Forecast type"
                print map.forecast_type
                #Get PickListValue ID
                print "\nPickListValue ID"
                print map.id
                #Get PickListValue sequence number
                print "\nPickListValue sequence number"
                print map.sequence_number
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
          exception = response_handler
          # Get the Code
          print 'code:'
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the Details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      elsif status_code != 204
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end

  def self.get_pipeline(pipeline_id,layout_id)
    # """
    # This method is used to get single pipeline with ID and print the response.
    # :param pipeline_id: The ID of the Pipeline to be obtained
    # """

    # """
    # example
    # pipeline_id = "34096432212003";
    # """
    # Get instance of PipelineOperations Class
    po = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    # Call get_pipeline method that takes pipeline_id as parameter
    response = po.get_pipeline(pipeline_id)
    unless response.nil?
        status_code = response.status_code
        # Get the status code from response
        print "\n Status Code :" + status_code.to_s
        if [204, 304].include? status_code
          print(status_code == 204 ? 'No Content' : 'Not Modified')
          return
        end
        # Check if expected instance is received.
        if response.is_expected
          # Get object from response
          response_handler = response.data_object
          if response_handler.is_a? ZOHOCRMSDK::Pipeline::ResponseWrapper
            # Get the list of Pipeline instances
            pipelines = response_handler.pipeline
            pipelines.each do |pipeline|
              # Get the ID of each Pipeline
              print 'pipeline ID:'
              print pipeline.id.to_s
              # Get the Display value of each Pipeline
              print "\n pipeline Display value:"
              print pipeline.display_value
              # Get the Actual value of each Pipeline
              print "\n pipeline Actual value:"
              print pipeline.actual_value
              # Get the default of each Pipeline
              print "\n pipeline default:"
              print pipeline.default
              # Get the child available of each Pipeline
              print "\n pipeline child available:"
              print pipeline.child_available
              # Get the parent of each Pipeline
              parent = pipeline.parent
              if !parent.nil?
                  print "\n pipeline parent id:"
                  print parent.id
              end
              maps = pipeline.maps
              maps.each do |map|
                  #Get PickListValue Actual Value
                  print "\nPickListValue Actual Value"
                  print map.actual_value
                  #Get PickListValue delete
                  print "\nPickListValue delete" 
                  print map.delete
                  #Get PickListValue Display Value
                  print "\nPickListValue Display Value"
                  print map.display_value
                  forecast_category = map.forecast_category
                  if !forecast_category.nil?
                      #Get Forecast Category Name
                      print "\nForecast Category Name" 
                      print forecast_category.name
                      #Get Forecast Category id
                      print "\nForecast Category ID"
                      print forecast_category.id
                  end
               
                  #Get PickListValue Forecast type
                  print "\nPickListValue Forecast type"
                  print map.forecast_type
                  #Get PickListValue ID
                  print "\nPickListValue ID"
                  print map.id
                  #Get PickListValue sequence number
                  print "\nPickListValue sequence number"
                  print map.sequence_number
              end
            end
          # Check if the request returned an exception
          elsif response_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
            exception = response_handler
            # Get the Code
            print 'code:'
            print exception.code.value
            # Get the Status
            print "\n status:"
            print exception.status.value
            # Get the Message
            print "\n message:"
            print exception.message.value
            # Get the Details map
            exception.details.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            print "\n"
          end
        elsif status_code != 204
          response_object = response.data_object
          response_object.instance_variables.each do |field|
            print field
            print "\n"
            print response_object.instance_variable_get(field)
          end
        end
      end
  end

  def self.create_pipelines(layout_id)
    # """
    # This method is used to create pipelines and print the response.
    # """
    # List to hold Pipeline instances
    pipelines = []
    (6..10).each do |i|
      # Get instance of Pipeline Class
      pipeline = ZOHOCRMSDK::Pipeline::Pipeline.new
      pipeline.display_value="Pipeline23"
      pipeline.default = true
      picklist = ZOHOCRMSDK::Pipeline::PickListValue.new
      picklist.sequence_number = 1
      picklist.id = 36523976815
      picklist.display_value = "Closed won"
      maps = [picklist]
      pipeline.maps = maps
      pipelines.push(pipeline)
    end
    # Set the list of pipeline in BodyWrapper instance
    body_wrapper = ZOHOCRMSDK::Pipeline::BodyWrapper.new
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper.pipeline = pipelines
    # Get instance of PipelineOperations Class
    po = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    # Call create_pipelines method that takes BodyWrapper instance as parameter
    response = po.create_pipelines(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Pipeline::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.pipeline
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Pipeline::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
              print success_response.code.value
              # Get the Status
              print "\n status:"
              print success_response.status.value
              # Get the Message
              print "\n message:"
              print success_response.message.value
              # Get the details map
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::Pipeline::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
              print api_exception.code.value
              # Get the Status
              print "\n status:"
              print api_exception.status.value
              # Get the Message
              print "\n message:"
              print api_exception.message.value
              # Get the details map
              api_exception.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              print "\n"
            end
          end
          # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
          exception = action_handler
          # Get the Code
          print 'code:'
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      else
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end

  def self.update_pipelines(layout_id)
    # """
    # This method is used to update pipelines and print the response.
    # """
    # List to hold Pipeline instances
    pipeline_ids = [131231313,12312313]
    pipelines = []
    (0..1).each do |i|
        pipeline = ZOHOCRMSDK::Pipeline::Pipeline.new
        pipeline.display_value="Pipeline2"
        pipeline.default = true
        picklist = ZOHOCRMSDK::Pipeline::PickListValue.new
        picklist.sequence_number = 1
        picklist.id = 36523976815
        picklist.display_value = "Closed won"
        maps = [picklist]
        pipeline.id =pipeline_ids[i]
        pipeline.maps = maps
        pipelines.push(pipeline)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::Pipeline::BodyWrapper.new
    # Set the list to pipeline in BodyWrapper instance
    body_wrapper.pipeline = pipelines
    # Get instance of PipelineOperations Class
    po = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    response = po.update_pipelines(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Pipeline::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.pipeline
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Pipeline::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
              print success_response.code.value
              # Get the Status
              print "\n status:"
              print success_response.status.value
              # Get the Message
              print "\n message:"
              print success_response.message.value
              # Get the details map
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::Pipeline::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
              print api_exception.code.value
              # Get the Status
              print "\n status:"
              print api_exception.status.value
              # Get the Message
              print "\n message:"
              print api_exception.message.value
              # Get the details map
              api_exception.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              print "\n"
            end
          end
          # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
          exception = action_handler
          # Get the Code
          print 'code:'
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      else
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end

  def self.update_pipeline(pipeline_id,layout_id)
    # """
    # This method is used to update single pipeline with ID and print the response.
    # :param pipeline_id: The ID of the Pipeline to be updated
    # """

    # """
    # example
    # pipeline_id = "34096432212003";
    # """
    # List to hold Pipeline instances
    pipeline = ZOHOCRMSDK::Pipeline::Pipeline.new
    pipeline.display_value="Adfasfsad1"
    pipeline.default = true
    picklist = ZOHOCRMSDK::Pipeline::PickListValue.new
    picklist.id = 34770616801
    picklist.sequence_number = 1
    picklist.display_value = "Adfasfsad1"
    maps = [picklist]
    pipeline.maps = maps
    pipelines =[]
    pipelines.push(pipeline)
    body_wrapper = ZOHOCRMSDK::Pipeline::BodyWrapper.new
    # Set the list to pipeline in BodyWrapper instance
    body_wrapper.pipeline = pipelines
    # Get instance of PipelineOperations Class
    po = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    # Call update_pipeline method that takes BodyWrapper instance and pipeline_id as parameters
    response = po.update_pipeline(pipeline_id,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Pipeline::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.pipeline
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Pipeline::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
              print success_response.code.value
              # Get the Status
              print "\n status:"
              print success_response.status.value
              # Get the Message
              print "\n message:"
              print success_response.message.value
              # Get the details map
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::Pipeline::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
              print api_exception.code.value
              # Get the Status
              print "\n status:"
              print api_exception.status.value
              # Get the Message
              print "\n message:"
              print api_exception.message.value
              # Get the details map
              api_exception.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              print "\n"
            end
          end
          # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
          exception = action_handler
          # Get the Code
          print 'code:'
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      else
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end

  def self.transfer_and_delete(layout_id)
    # """
    # This method is used to create pipelines and print the response.
    # """
    # List to hold TransferAndDeleteWrapper instances
    transfer_pipelines = []

    transfer_and_delete_wrapper = ZOHOCRMSDK::Pipeline::TransferAndDeleteWrapper.new()
    transfer_pipeline = ZOHOCRMSDK::Pipeline::TransferPipeLine.new
    pipeline = ZOHOCRMSDK::Pipeline::Pipeline.new
    pipeline.from = 36523973712004
    pipeline.to=36523973712004
    stage = ZOHOCRMSDK::Pipeline::Stage.new
    stage.from = 36523976817
    stage.to = 36523976817
    stages = [stage]
    transfer_pipeline.pipeline = pipeline
    transfer_pipeline.stages = stages
    transfer_pipelines= [transfer_pipeline]
    
    # Set the list of pipeline in BodyWrapper instance
    body_wrapper = ZOHOCRMSDK::Pipeline::TransferAndDeleteWrapper.new
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper.transfer_pipeline = transfer_pipelines
    # Get instance of PipelineOperations Class
    po = ZOHOCRMSDK::Pipeline::PipelineOperations.new(layout_id)
    # Call create_pipelines method that takes BodyWrapper instance as parameter
    response = po.transfer_and_delete(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Pipeline::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.pipeline
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Pipeline::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
              print success_response.code.value
              # Get the Status
              print "\n status:"
              print success_response.status.value
              # Get the Message
              print "\n message:"
              print success_response.message.value
              # Get the details map
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::Pipeline::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
              print api_exception.code.value
              # Get the Status
              print "\n status:"
              print api_exception.status.value
              # Get the Message
              print "\n message:"
              print api_exception.message.value
              # Get the details map
              api_exception.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              print "\n"
            end
          end
          # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Pipeline::APIException
          exception = action_handler
          # Get the Code
          print 'code:'
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end
          print "\n"
        end
      else
        response_object = response.data_object
        response_object.instance_variables.each do |field|
          print field
          print "\n"
          print response_object.instance_variable_get(field)
        end
      end
    end
  end
end
