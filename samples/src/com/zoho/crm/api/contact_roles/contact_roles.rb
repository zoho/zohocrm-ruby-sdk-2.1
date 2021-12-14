require 'ZOHOCRMSDK2_1'

class Contact_Roles
  def self.get_contact_roles
    # """
    # This method is used to get all the Contact Roles and print the response.
    # """
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
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
        if response_handler.is_a? ZOHOCRMSDK::ContactRoles::ResponseWrapper
          # Get the list of ContactRole instances
          contact_roles = response_handler.contact_roles
          contact_roles.each do |cr|
            # Get the ID of each ContactRole
            print '\ncontact role ID:'
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
        elsif response_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
    # contact_role_id = "34096432212003";
    # """
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
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
        if response_handler.is_a? ZOHOCRMSDK::ContactRoles::ResponseWrapper
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
        elsif response_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
      contact_role = ZOHOCRMSDK::ContactRoles::ContactRole.new
      # Set name of the Contact Role
      contact_role.name = i.to_s
      contact_roles.push(contact_role)
    end
    # Set the list of contactRoles in BodyWrapper instance
    body_wrapper = ZOHOCRMSDK::ContactRoles::BodyWrapper.new
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper.contact_roles = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
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
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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

  def self.update_contact_roles
    # """
    # This method is used to update Contact Roles and print the response.
    # """
    # List to hold ContactRole instances
    contact_roles = []

    contact_ids = [347706112796003, 347706112796005, 347706112796001]

    (0..1).each do |i|
      # Get instance of ContactRole Class
      contact_role = ZOHOCRMSDK::ContactRoles::ContactRole.new
      # Set ID to the ContactRole instance
      contact_role.id = contact_ids[i]
      # Set name to the ContactRole instance
      contact_role.name = (i + 10).to_s
      contact_roles.push(contact_role)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::ContactRoles::BodyWrapper.new
    # Set the list to contactRoles in BodyWrapper instance
    body_wrapper.contact_roles = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
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
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
    # contact_role_id = "34096432212003";
    # """
    # List to hold ContactRole instances
    contact_roles = []
    # Get instance of ContactRole Class
    contact_role = ZOHOCRMSDK::ContactRoles::ContactRole.new
    # Set name to the ContactRole instance
    contact_role.name = '1'
    contact_roles.push(contact_role)
    body_wrapper = ZOHOCRMSDK::ContactRoles::BodyWrapper.new
    # Set the list to contactRoles in BodyWrapper instance
    body_wrapper.contact_roles = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
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
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
    # contact_role_id = "34096432212003";
    # """
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
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
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
    # contact_role_ids = ["34096432157002", "34096431619001", "34096436883"];
    # """
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Add ids to ParameterMap instance
    contact_role_ids.each do |contact_role_id|
      pm.add(ZOHOCRMSDK::ContactRoles::ContactRolesOperations::DeleteContactRolesParam.ids, contact_role_id)
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
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.contact_roles
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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

  def self.get_all_contact_roles_of_deal(deal_id)
    # """
    # Get All ContactRoles Of Deal
    # :param deal_id:
    # """

    # """
    # example
    # deal_id = "34096432212003";
    # """
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
    # Call get_all_contact_roles_of_deal method that takes deal_id as parameter
    response = cro.get_all_contact_roles_of_deal(deal_id)
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
        # Check if expected RecordResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::ContactRoles::RecordResponseWrapper
          # Get the list of obtained Record instances
          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\nRecordID: "
            print record.id.to_s
            # Get the createdBy User instance of each Record
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\nRecord Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\nRecord Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\nRecord Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\nRecord CreatedTime: "
            print record.created_time
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the Modified User
              print "\nRecord Modified By User-Name: "
              print modified_by.name
              # Get the ID of the Modified User
              print "\nRecord Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the Modified User
              print "\nRecord Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\nRecord ModifiedTime: "
            print record.modified_time
            # Get the Field Value of each Record
            print "\nRecord Field Value: "
            print record.get_key_value('Last_Name')
            print "\nRecord KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                data_list.each do |data|
                  if data.is_a? Hash
                    print "\n Record KeyName : " + key_name + '-Value : '
                    data.each do |k, v|
                      print "\n" + k + ':' + v
                    end
                  else
                    print data
                  end
                end
              elsif value.is_a? Hash
                print "\n Record KeyName : " + key_name + '-Value : '
                value.each do |k, v|
                  print "\n" + k + ':'
                  print v
                end
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n RelatedRecord Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n RelatedRecord Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n RelatedRecord Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n RelatedRecord Info more records: "
              print info.more_records
            end
          end
        elsif response_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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

  def self.get_contact_role_of_deal(contact_id, deal_id)
    # """
    # Get All ContactRoles Of Deal
    # :param deal_id:
    # """

    # """
    # example
    # deal_id = "34096432212003";
    # """
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
    # Call get_contact_role_of_deal method that takes contact_id and deal_id as parameter
    response = cro.get_contact_role_of_deal(contact_id, deal_id)
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
        # Check if expected RecordResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::ContactRoles::RecordResponseWrapper
          # Get the list of obtained Record instances
          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\nRecordID: "
            print record.id.to_s
            # Get the createdBy User instance of each Record
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\nRecord Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\nRecord Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\nRecord Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\nRecord CreatedTime: "
            print record.created_time
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the Modified User
              print "\nRecord Modified By User-Name: "
              print modified_by.name
              # Get the ID of the Modified User
              print "\nRecord Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the Modified User
              print "\nRecord Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\nRecord ModifiedTime: "
            print record.modified_time
            # Get the Field Value of each Record
            print "\nRecord Field Value: "
            print record.get_key_value('Last_Name')
            print "\nRecord KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                data_list.each do |data|
                  if data.is_a? Hash
                    print "\n Record KeyName : " + key_name + '-Value : '
                    data.each do |k, v|
                      print "\n" + k + ':' + v
                    end
                  else
                    print data
                  end
                end
              elsif value.is_a? Hash
                print "\n Record KeyName : " + key_name + '-Value : '
                value.each do |k, v|
                  print "\n" + k + ':'
                  print v
                end
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n RelatedRecord Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n RelatedRecord Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n RelatedRecord Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n RelatedRecord Info more records: "
              print info.more_records
            end
          end
        elsif response_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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

  def self.add_contact_role_to_deal(contact_id, deal_id)
    # List to hold ContactRole instances
    contact_roles = []
    # Get instance of ContactRole Class
    contact_role = ZOHOCRMSDK::ContactRoles::ContactRoleWrapper.new
    # Set name to the ContactRole instance
    contact_role.contact_role = 'contactRole1'
    contact_roles.push(contact_role)
    body_wrapper = ZOHOCRMSDK::ContactRoles::RecordBodyWrapper.new
    # Set the list to contactRoles in BodyWrapper instance
    body_wrapper.data = contact_roles
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
    # Call add_contact_role_to_deal method that takes contact_id, deal_id and BodyWrapper instance as parameters
    response = cro.add_contact_role_to_deal(contact_id, deal_id, body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::RecordActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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

  def self.remove_contact_role_from_deal(contact_id, deal_id)
    # Get instance of ContactRolesOperations Class
    cro = ZOHOCRMSDK::ContactRoles::ContactRolesOperations.new
    # Call remove_contact_role_from_deal method that takes contact_id and deal_id as parameters
    response = cro.remove_contact_role_from_deal(contact_id, deal_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::ContactRoles::RecordActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::ContactRoles::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::ContactRoles::APIException
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
