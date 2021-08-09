require 'ZCRMSDK'

class VariableGroup
  def self.get_variable_groups
    # """
    # This method is used to get the details of all the variable groups and print the response.
    # """

    # Get instance of VariableGroupsOperations Class
    vgo = VariableGroups::VariableGroupsOperations.new
    # Call get_variable_groups method
    response = vgo.get_variable_groups
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
        if response_handler.is_a? VariableGroups::ResponseWrapper
          # Get the list of obtained VariableGroup instances
          variable_groups = response_handler.variable_groups
          variable_groups.each do |variable_group|
            # Get the APIName of each VariableGroup
            print "\n VariableGroup APIName: "
            print variable_group.api_name
            # Get the Name of each VariableGroup
            print "\n VariableGroup Name: "
            print variable_group.name
            # Get the Description of each VariableGroup
            print "\n VariableGroup Description: "
            print variable_group.description
            print "\n VariableGroup ID: "
            # Get the ID of each VariableGroup
            print variable_group.id.to_s
            # Get the DisplayLabel of each VariableGroup
            print "\n VariableGroup DisplayLabel: "
            print variable_group.display_label
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? VariableGroups::APIException
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

  def self.get_variable_group_by_id(variable_group_id)
    # """
    # This method is used to get the details of any variable group with group id and print the response.
    # :param variable_group_id: The ID of the VariableGroup to be obtained
    # """

    # """
    # example
    # variable_group_id = '340964302275023'
    # """
    # Get instance of VariableGroupsOperations Class
    vgo = VariableGroups::VariableGroupsOperations.new
    # Call get_variable_group_by_id method that takes variable_group_id as parameter
    response = vgo.get_variable_group_by_id(variable_group_id)
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
        if response_handler.is_a? VariableGroups::ResponseWrapper
          # Get the list of obtained VariableGroup instances
          variable_groups = response_handler.variable_groups
          variable_groups.each do |variable_group|
            # Get the APIName of each VariableGroup
            print "\n VariableGroup APIName: "
            print variable_group.api_name
            # Get the Name of each VariableGroup
            print "\n VariableGroup Name: "
            print variable_group.name
            # Get the Description of each VariableGroup
            print "\n VariableGroup Description: "
            print variable_group.description
            print "\n VariableGroup ID: "
            # Get the ID of each VariableGroup
            print variable_group.id.to_s
            # Get the DisplayLabel of each VariableGroup
            print "\n VariableGroup DisplayLabel: "
            print variable_group.display_label
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? VariableGroups::APIException
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

  def self.get_variable_group_by_api_name(variable_group_name)
    # """
    # This method is used to get the details of any variable group with group API name and print the response.
    # :param variable_group_api_name: The API Name of the VariableGroup to be obtained
    # """

    # """
    # variable_group_api_name = 'General'
    # """

    # Get instance of VariableGroupsOperations Class
    vgo = VariableGroups::VariableGroupsOperations.new
    # Call get_variable_group_by_api_name method that takes variable_group_api_name as parameter
    response = vgo.get_variable_group_by_api_name(variable_group_name)
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
        if response_handler.is_a? VariableGroups::ResponseWrapper
          # Get the list of obtained VariableGroup instances
          variable_groups = response_handler.variable_groups
          variable_groups.each do |variable_group|
            # Get the APIName of each VariableGroup
            print "\n VariableGroup APIName: "
            print variable_group.api_name
            # Get the Name of each VariableGroup
            print "\n VariableGroup Name: "
            print variable_group.name
            # Get the Description of each VariableGroup
            print "\n VariableGroup Description: "
            print variable_group.description
            print "\n VariableGroup ID: "
            # Get the ID of each VariableGroup
            print variable_group.id.to_s
            # Get the DisplayLabel of each VariableGroup
            print "\n VariableGroup DisplayLabel: "
            print variable_group.display_label
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? VariableGroups::APIException
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
end
