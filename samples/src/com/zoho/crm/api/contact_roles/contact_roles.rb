require 'ZCRMSDK'

class Contact_Roles
  def self.get_contact_roles
    # """
    # This method is used to get all the Contact Roles and print the response.
    # """
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    # Call get_contact_roles method
    response = cro.get_contact_roles
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
        if response_handler.is_a? ContactRoles::ResponseWrapper
          # Get the list of ContactRole instances
          contact_roles = response_handler.contact_roles
          contact_roles.each do |cr|
            # Get the ID of each ContactRole
            print 'contact role ID:'
            print cr.id.to_s
            # Get the name of each ContactRole
            print "\n contact role Name:"
            print cr.name
            # Get the sequence number of each ContactRoles
            print "\n contact role Sequence Number:"
            print cr.sequence_number
            print "\n"
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ContactRoles::APIException
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

  def self.get_contact_role(contact_role_id)
    # """
    # This method is used to get single Contact Role with ID and print the response.
    # :param contact_role_id: The ID of the ContactRole to be obtained
    # """

    # """
    # example
    # contact_role_id = "340964302212003";
    # """
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    # Call get_contact_role method that takes contact_role_id as parameter
    response = cro.get_contact_role(contact_role_id)
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
        if response_handler.is_a? ContactRoles::ResponseWrapper
          # Get the list of ContactRole instances
          contact_roles = response_handler.contact_roles
          contact_roles.each do |cr|
            # Get the ID of each ContactRole
            print 'contact role ID:'
            print cr.id.to_s
            # Get the name of each ContactRole
            print "\n contact role Name:"
            print cr.name
            # Get the sequence number of each ContactRoles
            print "\n contact role Sequence Number:"
            print cr.sequence_number
            print "\n"
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ContactRoles::APIException
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

  def self.create_contact_roles
    # """
    # This method is used to create Contact Roles and print the response.
    # """
    # List to hold ContactRole instances
    contact_roles = []
    (6..10).each do |i|
      # Get instance of ContactRole Class
      contact_role = ContactRoles::ContactRole.new
      # Set name of the Contact Role
      contact_role.name = i.to_s
      contact_roles.push(contact_role)
    end
    # Set the list of contactRoles in BodyWrapper instance
    body_wrapper = ContactRoles::BodyWrapper.new
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper.contact_roles = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    # Call create_contact_roles method that takes BodyWrapper instance as parameter
    response = cro.create_contact_roles(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ContactRoles::APIException
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
        elsif action_handler.is_a? ContactRoles::APIException
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

  def self.update_contact_roles(contact_ids)
    # """
    # This method is used to update Contact Roles and print the response.
    # """
    # List to hold ContactRole instances
    contact_roles = []
    (0..1).each do |i|
      # Get instance of ContactRole Class
      contact_role = ContactRoles::ContactRole.new
      # Set ID to the ContactRole instance
      contact_role.id = contact_ids[i]
      # Set name to the ContactRole instance
      contact_role.name = (i + 10).to_s
      contact_roles.push(contact_role)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ContactRoles::BodyWrapper.new
    # Set the list to contactRoles in BodyWrapper instance
    body_wrapper.contact_roles = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    response = cro.update_contact_roles(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ContactRoles::APIException
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
        elsif action_handler.is_a? ContactRoles::APIException
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

  def self.update_contact_role(contact_role_id)
    # """
    # This method is used to update single Contact Role with ID and print the response.
    # :param contact_role_id: The ID of the ContactRole to be updated
    # """

    # """
    # example
    # contact_role_id = "340964302212003";
    # """
    # List to hold ContactRole instances
    contact_roles = []
    # Get instance of ContactRole Class
    contact_role = ContactRoles::ContactRole.new
    # Set name to the ContactRole instance
    contact_role.name = '1'
    contact_roles.push(contact_role)
    body_wrapper = ContactRoles::BodyWrapper.new
    # Set the list to contactRoles in BodyWrapper instance
    body_wrapper.contact_roles = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    # Call update_contact_role method that takes BodyWrapper instance and contact_role_id as parameters
    response = cro.update_contact_role(contact_role_id,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ContactRoles::APIException
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
        elsif action_handler.is_a? ContactRoles::APIException
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

  def self.delete_contact_role(contact_role_id)
    # """
    # This method is used to delete single Contact Role with ID and print the response.
    # :param contact_role_id: ID of the ContactRole to be deleted
    # """

    # """
    # example
    # contact_role_id = "340964302212003";
    # """
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    # Call delete_contact_role which takes contact_role_id as parameter
    response = cro.delete_contact_role(contact_role_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ContactRoles::APIException
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
        elsif action_handler.is_a? ContactRoles::APIException
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

  def self.delete_contact_roles(contact_role_ids)
    # """
    # This method is used to delete Contact Roles and print the response.
    # :param contact_role_ids: The list of ContactRole IDs to be deleted.
    # """

    # """
    # contact_role_ids = ["340964302157002", "340964301619001", "34096436883"];
    # """
    # Get instance of ContactRolesOperations Class
    cro = ContactRoles::ContactRolesOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Add ids to ParameterMap instance
    contact_role_ids.each do |contact_role_id|
      pm.add(ContactRoles::ContactRolesOperations::DeleteContactRolesParam.ids, contact_role_id)
    end
    # Call delete_contact_roles method that takes ParameterMap instance as parameter
    response = cro.delete_contact_roles(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ContactRoles::APIException
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
        elsif action_handler.is_a? ContactRoles::APIException
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
