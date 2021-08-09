require 'ZCRMSDK'

class Variable
  def self.get_variables
    # """
    # This method is used to retrieve all the available variables through an API request and print the response.
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Possible parameters of Get Variables operation
    pm.add(Variables::VariablesOperations::GetVariablesParam.group, 'created')
    # Call get_variables method that takes ParameterMap instance as parameter
    response = vo.get_variables(pm)
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
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? Variables::ResponseWrapper
          # Get the list of obtained Variable instances
          variables = response_handler.variables
          variables.each do |variable|
            # Get the APIName of each Variable
            print "\n Variable APIName: "
            print variable.api_name
            # Get the Name of each Variable
            print "\n Variable Name: "
            print variable.name
            # Get the Description of each Variable
            print "\n Variable Description: "
            print variable.description
            # Get the ID of each Variable
            print "\n Variable ID: "
            print variable.id.to_s
            # Get the Type of each Variable
            print "\n Variable Type: "
            print variable.type
            # Get the VariableGroup instance of each Variable
            variable_group = variable.variable_group
            unless variable_group.nil?
              # Get the APIName of the VariableGroup
              print "\n Variable VariableGroup APIName: "
              print variable_group.api_name
              # Get the ID of the VariableGroup
              print "\n Variable VariableGroup ID: "
              print variable_group.id.to_s
            end
            # Get the Value of each Variable
            print "\n Variable Value: "
            print variable.value
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Variables::APIException
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

  def self.create_variables
    # """
    # This method is used to create variables and print the response.
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Variables::BodyWrapper.new
    # List to hold Variable instances
    variables = []
    # Get instance of VariableGroup Class
    group = VariableGroups::VariableGroup.new
    # Set Name to variable_group
    group.name = 'created'
    for i in 10..14
      # Get instance of Variable Class
      variable = Variables::Variable.new
      # Set the type to Variable
      variable.type = 'integer'
      # Set the value
      variable.value = 1
      # Set the name to variable
      variable.name = i.to_s
      # Set the API name to variable
      variable.api_name = i.to_s
      # Set the VariableGroup to Variable instance
      variable.variable_group = group
      # Set the description to variable
      variable.description = i.to_s
      # Add the variable instance to the array
      variables.push(variable)
    end
    # Set the list to variables in BodyWrapper instance
    bw.variables = variables
    # Call create_variables method that takes BodyWrapper instance as parameter
    response = vo.create_variables(bw)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Variables::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.variables
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Variables::SuccessResponse
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
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Variables::APIException
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
        elsif action_handler.is_a? Variables::APIException
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

  def self.update_variables(variable_ids)
    # """
    # This method is used to update details of variables in CRM and print the response.
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Variables::BodyWrapper.new
    # Get instance of VariableGroup Class
    group = VariableGroups::VariableGroup.new
    # Set Name to variable_group
    group.name = 'created'
    variables = []
    for i in 0..1
      # Get instance of Variable Class
      variable = Variables::Variable.new
      # Set the type to Variable
      # variable.type = 'integer'
      # # Set the value
      variable.value = 2
      # Set the id
      variable.id = variable_ids[i]
      # # Set the name to variable
      # variable.name = i.to_s
      # # Set the API name to variable
      variable.api_name = i.to_s

      # # Set the description to variable
      # variable.description = i.to_s
      # # Add the variable instance to the array
      variables.push(variable)
    end
    # Set the list to variables in BodyWrapper instance
    bw.variables = variables
    # Call update_variables method that takes BodyWrapper instance as parameter
    response = vo.update_variables(bw)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Variables::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.variables
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Variables::SuccessResponse
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
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Variables::APIException
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
        elsif action_handler.is_a? Variables::APIException
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

  def self.delete_variables(variable_ids)
    # """
    # This method is used to delete details of multiple variables in CRM simultaneously and print the response.
    # :param variable_ids: The list of Variable IDs to be deleted
    # """

    # """
    # example
    # variable_ids = ["340964302275025", "340964302275035"]
    # """
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    variable_ids.each do |variable_id|
      # Possible parameters of Delete Variables operation
      pm.add(Variables::VariablesOperations::DeleteVariablesParam.ids, variable_id)
    end
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Call delete_variables method that takes ParameterMap instance as parameter
    response = vo.delete_variables(pm)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Variables::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.variables
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Variables::SuccessResponse
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
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Variables::APIException
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
        elsif action_handler.is_a? Variables::APIException
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

  def self.get_variable_by_id(variable_id)
    # """
    # This method is used to get the details of any specific variable with ID and print the response
    # :param variable_id: The ID of the Variable to be obtained
    # """

    # """
    # example
    # variable_id = 340964302275025
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of pm Class
    pm = ParameterMap.new
    # Possible parameters of Get Variable By ID operation
    pm.add(Variables::VariablesOperations::GetVariableByIDParam.group, 'created')
    # Call get_variable_by_id method that takes ParameterMap instance and variable_id as parameters
    response = vo.get_variable_by_id(variable_id, pm)
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
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? Variables::ResponseWrapper
          # Get the list of obtained Variable instances
          variables = response_handler.variables
          variables.each do |variable|
            # Get the APIName of each Variable
            print "\n Variable APIName: "
            print variable.api_name
            # Get the Name of each Variable
            print "\n Variable Name: "
            print variable.name
            # Get the Description of each Variable
            print "\n Variable Description: "
            print variable.description
            # Get the ID of each Variable
            print "\n Variable ID: "
            print variable.id.to_s
            # Get the Type of each Variable
            print "\n Variable Type: "
            print variable.type
            # Get the VariableGroup instance of each Variable
            variable_group = variable.variable_group
            unless variable_group.nil?
              # Get the APIName of the VariableGroup
              print "\n Variable VariableGroup APIName: "
              print variable_group.api_name
              # Get the ID of the VariableGroup
              print "\n Variable VariableGroup ID: "
              print variable_group.id.to_s
            end
            # Get the Value of each Variable
            print "\n Variable Value: "
            print variable.value
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Variables::APIException
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

  def self.update_variable_by_id(variable_id)
    # """
    # This method is used to update details of a specific variable in CRM and print the response.
    # :param variable_id: The ID of the Variable to be updated
    # :return:
    # """

    # """
    # example
    # variable_id = 340964302275025
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Variables::BodyWrapper.new
    # List to hold Variable instances
    variables = []
    # Get instance of Variable Class
    variable = Variables::Variable.new
    # Set the value
    variable.value = 3434
    # Add the variable instance to the array
    variables.push(variable)
    # Set the list to variables in BodyWrapper instance
    bw.variables = variables
    # Call update_variable_by_id method that takes BodyWrapper instance and variable_id as parameters
    response = vo.update_variable_by_id(variable_id,bw)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Variables::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.variables
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Variables::SuccessResponse
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
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Variables::APIException
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
        elsif action_handler.is_a? Variables::APIException
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

  def self.delete_variable(variable_id)
    # """
    # This method is used to delete details of a specific variable in CRM and print the response.
    # :param variable_id: The ID of the Variable to be deleted
    # """

    # """
    # example
    # variable_id = 340964302275025
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Call delete_variable method that takes variable_id as parameter
    response = vo.delete_variable(variable_id)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Variables::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.variables
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Variables::SuccessResponse
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
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Variables::APIException
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
        elsif action_handler.is_a? Variables::APIException
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

  def self.get_variable_for_api_name(variable_name)
    # """
    # This method is used to get the details of any specific variable with API Name
    # :param variable_api_name: The API name of the Variable to be obtained
    # """

    # """
    # example
    # variable_api_name = 'Variable55'
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Possible parameters of Get Variable For API Name operation
    pm.add(Variables::VariablesOperations::GetVariableForAPINameParam.group, 'General')
    # Call get_variable_for_api_name method that takes ParameterMap instance and variable_api_name as parameters
    response = vo.get_variable_for_api_name(variable_name,pm)
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
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? Variables::ResponseWrapper
          # Get the list of obtained Variable instances
          variables = response_handler.variables
          variables.each do |variable|
            # Get the APIName of each Variable
            print "\n Variable APIName: "
            print variable.api_name
            # Get the Name of each Variable
            print "\n Variable Name: "
            print variable.name
            # Get the Description of each Variable
            print "\n Variable Description: "
            print variable.description
            # Get the ID of each Variable
            print "\n Variable ID: "
            print variable.id.to_s
            # Get the Type of each Variable
            print "\n Variable Type: "
            print variable.type
            # Get the VariableGroup instance of each Variable
            variable_group = variable.variable_group
            unless variable_group.nil?
              # Get the APIName of the VariableGroup
              print "\n Variable VariableGroup APIName: "
              print variable_group.api_name
              # Get the ID of the VariableGroup
              print "\n Variable VariableGroup ID: "
              print variable_group.id.to_s
            end
            # Get the Value of each Variable
            print "\n Variable Value: "
            print variable.value
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Variables::APIException
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

  def self.update_variable_for_api_name(variable_name)
    # """
    # This method is used to update details of a specific variable in CRM with API Name and print the response.
    # :param variable_api_name: The API name of the Variable to be updated
    # """

    # """
    # example
    # variable_api_name = 'Variable55'
    # """
    # Get instance of VariablesOperations Class
    vo = Variables::VariablesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Variables::BodyWrapper.new
    # List to hold Variable instances
    variables = []
    # Get instance of Variable Class
    variable = Variables::Variable.new
    # Set the value
    variable.value = '45'
    # Add the variable instance to the array
    variables.push(variable)
    # Set the list to variables in BodyWrapper instance
    bw.variables = variables
    # Call update_variable_by_api_name method that takes BodyWrapper instance and variable_api_name as parameters
    response = vo.update_variable_by_api_name(variable_name,bw)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Variables::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.variables
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Variables::SuccessResponse
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
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Variables::APIException
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
        elsif action_handler.is_a? Variables::APIException
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
