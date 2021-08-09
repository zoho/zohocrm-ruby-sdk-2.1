require 'ZCRMSDK'

class SharedRecord
  def self.get_shared_record_details(module_api_name, record_id)
    # """
    # This method is used to get the details of a shared record and print the response.
    # :param module_api_name: The API Name of the module to get shared record details.
    # :param record_id: The ID of the record to be obtain shared information
    # :return:
    # """

    # """
    # example
    # module_api_name = Contacts
    # record_id = 340964302112011
    # """

    # Get instance of ShareRecordsOperations Class that takes module_api_name and record_id as parameter
    sro = ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Possible parameters of Get Shared Record Details operation
    # Allowed values - summary, manage
    pm.add(ShareRecords::ShareRecordsOperations::GetSharedRecordDetailsParam.view, 'summary')
    # Call get_shared_record_details method that takes ParameterMap instance as parameter
    response = sro.get_shared_record_details(pm)
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
        if response_handler.is_a? ShareRecords::ResponseWrapper
          # Get the list of obtained ShareRecord instances
          shared_records = response_handler.share
          shared_records.each do |shared_record|
            # Get the ShareRelatedRecords of each ShareRecord
            print "\n ShareRecord ShareRelatedRecords: "
            print shared_record.share_related_records
            # Get the SharedThrough instance of each ShareRecord
            shared_through = shared_record.shared_through
            # Check if sharedThrough is not null
            unless shared_through.nil?
              # Get the Module instance of each ShareRecord
              print "\n ShareRecord SharedThrough EntityName"
              print shared_through.entity_name
              module_ins = shared_through.module
              unless module_ins.nil?
                # Get the ID of the Module
                print "\n ShareRecord SharedThrough Module ID:"
                print module_ins.id.to_s
                # Get the Name of the Module
                print "\n ShareRecord SharedThrough Module Name:"
                print module_ins.name
              end
              # Get the ID of the SharedThrough
              print "\n ShareRecord SharedThrough ID:"
              print shared_through.id.to_s
            end
            # Get the SharedTime of each ShareRecord
            print "\n ShareRecord SharedTime: "
            print shared_record.shared_time
            # Get the Permission of each ShareRecord
            print "\n ShareRecord Permission: "
            print shared_record.permission
            # Get the Shared Record of each ShareRecord
            shared_by = shared_record.shared_by
            unless shared_by.nil?
              # Get the FullName of the  User
              print "\n ShareRecord SharedBy-FullName: "
              print shared_by.full_name
              # Get the ID of the  User
              print "\n ShareRecord SharedBy-ID: "
              print shared_by.id.to_s
              # Get the Zuid of the  User
              print "\n ShareRecord SharedBy-Zuid: "
              print shared_by.zuid
            end
            # Get the shared User instance of each ShareRecord
            user = shared_record.user
            unless user.nil?
              # Get the Name of the shared User
              print "\n ShareRecord User-Name: "
              print user.name
              # Get the ID of the shared User
              print "\n ShareRecord User-ID: "
              print user.id.to_s
              # Get the Zuid of the shared User
              print "\n ShareRecord User-Zuid: "
              print user.zuid
            end
          end
          # Get the list of obtained Shareable User instances
          shareable_users = response_handler.shareable_user
          # Get the Name of the shareable User
          # Get the ID of the shareable User
          # Get the Zuid of the shareable User
          shareable_users&.each do |shareable_user|
            # Get the Name of the shareable User
            print "\n ShareRecord User-Name: "
            print shareable_user.name
            # Get the ID of the shareable User
            print "\n ShareRecord User-ID: "
            print shareable_user.id.to_s
            # Get the Zuid of the shareable User
            print "\n ShareRecord User-Zuid: "
            print shareable_user.zuid
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ShareRecords::APIException
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

  def self.share_record(module_api_name, record_id)
    # """
    # This method is used to share the record and print the response.
    # :param module_api_name: The API Name of the module to share record.
    # :param record_id: The ID of the record to be shared
    # """

    # """
    # example
    # module_api_name = Contacts
    # record_id = 340964302112011
    # """
    # List to hold ShareRecord instances
    share_records = []
    # Get instance of ShareRecordsOperations Class that takes module_api_name and record_id as parameter
    sro = ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ShareRecords::BodyWrapper.new
    # Get instance of User Class
    user = Users::User.new
    # Set User ID
    user.id = 347706105791024
    (0..1).each do |i|
      # Get instance of ShareRecord Class
      share_record = ShareRecords::ShareRecord.new
      # Set boolean value to share related records
      share_record.share_related_records = true
      # Set the permission. Possible values - full_access, read_only, read_write
      share_record.permission = 'read_write'
      # Set the User instance to user
      share_record.user = user
      # Add the instance to list
      share_records.push(share_record)
    end
    # Set the list to share of BodyWrapper instance
    bw.share = share_records
    # Call share_record method that takes BodyWrapper instance as parameter
    response = sro.share_record(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ShareRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.share
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ShareRecords::SuccessResponse
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
            elsif action_response.is_a? ShareRecords::APIException
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
        elsif action_handler.is_a? ShareRecords::APIException
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

  def self.update_share_permissions(module_api_name, record_id)
    # """
    # This method is used to update the sharing permissions of a record granted to users as Read-Write, Read-only, or grant full access.
    # :param module_api_name: The API Name of the module to update share permissions.
    # :param record_id: The ID of the record
    # """

    # """
    # example
    # module_api_name = Contacts
    # record_id = 340964302112011
    # """
    # List to hold ShareRecord instances
    share_records = []
    # Get instance of ShareRecordsOperations Class that takes module_api_name and record_id as parameter
    sro = ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ShareRecords::BodyWrapper.new
    # Get instance of User Class
    user = Users::User.new
    # Set User ID
    user.id = 347706105791024
    (0..1).each do |i|
      share_record = ShareRecords::ShareRecord.new
      # Set boolean value to share related records
      share_record.share_related_records = true
      # Set the permission. Possible values - full_access, read_only, read_write
      share_record.permission = 'full_access'
      # Set the User instance to user
      share_record.user = user
      # Add the instance to list
      share_records.push(share_record)
    end
    # Set the list to share of BodyWrapper instance
    bw.share = share_records
    response = sro.update_share_permissions(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ShareRecords::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.share
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ShareRecords::SuccessResponse
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
              # Get the details
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end

            # Check if the request returned an exception
            elsif action_response.is_a? ShareRecords::APIException
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
        elsif action_handler.is_a? ShareRecords::APIException
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
          # Get the Detail
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

  def self.revoke_shared_record(module_api_name, record_id)
    # Get instance of ShareRecordsOperations Class that takes module_api_name and record_id as parameter
    sro = ShareRecords::ShareRecordsOperations.new(record_id, module_api_name)
    # Call revoke_shared_record method
    response = sro.revoke_shared_record
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected DeleteActionWrapper instance is received.
        if action_handler.is_a? ShareRecords::DeleteActionWrapper
          delete_action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_response = delete_action_wrapper.share
          # Check if expected SuccessResponse instance is received
          if action_response.is_a? ShareRecords::SuccessResponse
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
            # Get the details dict
            success_response.details.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end

          # Check if the request returned an exception
          elsif action_response.is_a? ShareRecords::APIException
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
        # Check if the request returned an exception
        elsif action_handler.is_a? ShareRecords::APIException
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
          # Get the details dict
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
