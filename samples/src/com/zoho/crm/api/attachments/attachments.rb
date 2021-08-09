require 'ZCRMSDK'

class Attachment
  # """
  # This method is used to get a single record's attachments' details with ID and print the response.
  # :param module_api_name: The API Name of the record's module
  # :param record_id: The ID of the record to get attachments
  # """

  # """
  # example
  # module_api_name = 'Leads'
  # record_id = 340964302267003
  # """
  def self.get_attachments(module_api_name, record_id)
    # Get instance of AttachmentsOperations Class that takes record_id and module_api_name as parameters
    ao = Attachments::AttachmentsOperations.new(module_api_name,record_id)

    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    pm.add(Attachments::AttachmentsOperations::GetAttachmentsParam.page, 1)
    pm.add(Attachments::AttachmentsOperations::GetAttachmentsParam.per_page, 1)
    # Call get_attachments method
    response = ao.get_attachments(pm)

    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      #Check if expected instance is received
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? Attachments::ResponseWrapper

          attachments = response_handler.data
          attachments.each do |attachment|
            # Get the owner User instance of each attachment
            owner = attachment.owner
            # Check if owner is not None
            unless owner.nil?
              # Get the ID of the Owner
              print "\n Attachment Owner User-ID:"
              print owner.id.to_s
              # Get the ID of the Owner
              print "\n Attachment Owner User-Name:"
              print owner.name
              # Get the Email of the Owner
              print "\n Attachment Owner User-Email:"
              print owner.email
              print "\n"
            end
            # Get the modified time of each attachment
            print "\n Attachment Modified Time:"
            print attachment.modified_time
            # Get the name of the File
            print "\n Attachment File Name:"
            print attachment.file_name
            # Get the created time of each attachment
            print "\n Attachment Created Time:"
            print attachment.created_time
            # Get the Attachment file size
            print "\n Attachment File Size:"
            print attachment.size
            print "\n"
            # Get the parentId Record instance of each attachment
            parent_id = attachment.parent_id
            unless parent_id.nil?
              # Get the parent record Name of each attachment
              print "\n Attachment parent record Name: "
              print parent_id.get_key_value('name')
              # Get the parent record ID of each attachment
              print "\n Attachment parent record ID: "
              print parent_id.get_key_value('id')
            end
            # Check if the attachment is Editable
            print "\n Attachment Editable:"
            print attachment.editable
            # Get the file ID of each attachment
            print "\n Attachment File ID:"
            print attachment.file_id
            # Get the attachment SharingPermission
            print "\n Attachment SharingPermission:"
            print attachment.sharing_permission
            # Get the type of each attachment
            print "\n Attachment File Type:"
            print attachment.type
            # Get the Attachmenttype of each attachment
            print "\n Attachment Type:"
            print attachment.attachment_type
            # Get the seModule of each attachment
            print "\n Attachment seModule:"
            print attachment.se_module
            print "\n"
            # Get the modifiedBy User instance of each attachment
            modified_by = attachment.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the ID of the modifiedBy User
              print "\n Attachment Modified  User-ID"
              print modified_by.id.to_s
              # Get the Name of the modifiedBy User
              print "\n Attachment Modified User-Name:"
              print modified_by.name
              # Get the Email of the modifiedBy User
              print "\n Attachment Modified User-Email:"
              print modified_by.email
              print "\n"
            end
            # Get the state of each attachment
            print "\n Attachment State:"
            print attachment.state
            # Get the ID of each attachment
            print "\n Attachment ID:"
            print attachment.id.to_s
            # Get the modifiedBy User instance of each attachment
            created_by = attachment.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the modifiedBy User
              print "\n Attachment Created User-Name:"
              print created_by.id.to_s
              # Get the ID of the modifiedBy User
              print "\n Attachment Created User-ID:"
              print created_by.name
              # Get the Email of the modifiedBy User
              print "\n Attachment Created User-Email:"
              print created_by.email
              print "\n"
            end
            # Get the linkUrl of each attachment
            print "\n Attachment LinkUrl"
            print attachment.link_url
          end

          info = response_handler.info

          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n Attachment Info Per page: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Attachment Info Count: "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n Attachment Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n Attachment Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Attachments::APIException
          exception = response_handler
          # Get the Code
          print "\n code:"
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value
          print "\n"
          # Get the details map
          exception.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end

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

  def self.upload_attachment(module_api_name, record_id, absolute_file_path)
    # """
    # This method is used to upload attachments and print the response
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to upload attachment
    # :param absolute_file_path: The absolute file path of the file to be attached
    # """

    # """
    # example
    # module_api_name= "module_api_name"
    # record_id = "267003";
    # absolute_file_path = "/Users/user-name/Documents/image.jpg";
    # """
    # Get instance of AttachmentsOperations Class that takes record_id and module_api_name as parameters
    ao = Attachments::AttachmentsOperations.new(module_api_name,record_id)
    # Get instance of FileBodyWrapper class that will contain the request file
    fbw = Attachments::FileBodyWrapper.new
    # """
    # StreamWrapper can be initialized in any of the following ways

    # * param 1 -> fileName
    # * param 2 -> Read Stream.
    # * param 3 -> Absolute File Path of the file to be attached
    # """
    # stream_wrapper = StreamWrapper.new(name,stream,absolutefilepath)
    sw = Util::StreamWrapper.new(nil, nil, absolute_file_path)
    # Set file to the FileBodyWrapper instance
    fbw.file = sw
    # Call upload_attachment method that takes FileBodyWrapper instance as parameter
    response = ao.upload_attachment(fbw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code : " + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Attachments::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Attachments::SuccessResponse
              success_response = action_response
              # Get the Code
              print "\n code:"
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
                print " : "
                print v
                print "\n"
              end

            # Check if the request returned an exception
            elsif action_response.is_a? Attachments::APIException
              api_exception = action_response
              # Get the Code
              print "\n code:"
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
        elsif action_handler.is_a? Attachments::APIException
          exception = action_handler
          # Get the Code
          print "\n code:"
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value

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

  def self.delete_attachments(module_api_name, record_id, attachment_ids)
    # """
    # This method is used to Delete attachments of a single record with ID and print the response.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to delete attachments
    # :param attachment_ids: The list of attachment IDs to be deleted
    # """

    # """
    # example
    # module_api_name= "module_api_name"
    # record_id = "340964302267003";
    # attachment_ids = ['340964302267012', '340964302267018', '340964302267010']
    # """

    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Add the ids to parameter map instance
    attachment_ids.each do |attachment_id|
      pm.add(Attachments::AttachmentsOperations::DeleteAttachmentsParam.ids, attachment_id)
    end
    # Get instance of AttachmentsOperations Class that takes recordId and moduleAPIName as parameter
    ao = Attachments::AttachmentsOperations.new(module_api_name,record_id)
    # Call delete_attachments method that takes pm as parameter
    response = ao.delete_attachments(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Attachments::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Attachments::SuccessResponse
              success_response = action_response
              # Get the Code
              print "\n code:"
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
            elsif action_response.is_a? Attachments::APIException
              api_exception = action_response
              # Get the Code
              print "\n code:"
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
        elsif action_handler.is_a? Attachments::APIException
          exception = action_handler
          # Get the Code
          print "\n code:"
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

  def self.download_attachment(module_api_name, record_id, attachment_id, destination_folder)
    # """
    # This method is used to download an attachment of a single record of a module with ID and attachment ID and write the file in the specified destination.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to download attachment
    # :param attachment_id: The ID of the attachment to be downloaded
    # :param destination_folder: The absolute path of the destination folder to store the attachment
    # """

    # """
    # example
    # module_api_name = "module_api_name";
    # record_id = "340964302267003";
    # attachment_id = "340964302267024";
    # destination_folder = "/Users/user-name/Desktop";
    # """
    ao = Attachments::AttachmentsOperations.new(module_api_name,record_id)
    response = ao.download_attachment(attachment_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if status_code == 204
        print('No Content')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected FileBodyWrapper instance is receive
        if response_handler.is_a? Attachments::FileBodyWrapper
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          File.open(stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
        # Check if expected APIException instance is received.
        elsif response_handler.is_a? Attachments::APIException
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

  
  def self.delete_attachment(module_api_name, record_id, attachment_id)
    # """
    # This method is used to delete an attachment of a single record with ID and attachment ID and print the response
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to delete attachment
    # :param attachment_id: The ID of the attachment to be deleted
    # """

    # """
    # example
    # module_api_name = "module_api_name";
    # record_id = "340964302267003";
    # attachment_id = "340964302267024";
    # """

    # Get instance of AttachmentsOperations Class that takes recordId and moduleAPIName as parameter
    ao = Attachments::AttachmentsOperations.new(module_api_name,record_id)
    # Call delete_attachment method that takes attachment_id as parameter
    response = ao.delete_attachment(attachment_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Attachments::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Attachments::SuccessResponse
              success_response = action_response
              # Get the Code
              print "\n code:"
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
            elsif action_response.is_a? Attachments::APIException
              api_exception = action_response
              # Get the Code
              print "\n code:"
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
        elsif action_handler.is_a? Attachments::APIException
          exception = action_handler
          # Get the Code
          print "\n code:"
          print exception.code.value
          # Get the Status
          print "\n status:"
          print exception.status.value
          # Get the Message
          print "\n message:"
          print exception.message.value

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

  def self.upload_link_attachment(module_api_name, record_id, attachment_url)
    # """
    # This method is used to upload link attachment and print the response.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to upload Link attachment
    # :param attachment_url: The attachment url of the doc or image link to be attached
    # """

    # """
    # example
    # module_api_name = "module_api_name";
    # record_id = "340964302267003";
    # attachment_url = "https://5.imimg.com/data5/KJ/UP/MY-8655440/zoho-crm-500x500.png";
    # """
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Add the attachment_url to parameter Instance
    pm.add(Attachments::AttachmentsOperations::UploadLinkAttachmentParam.attachmentUrl, attachment_url)
    # Get instance of AttachmentsOperations Class that takes recordId and moduleAPIName as parameter
    ao = Attachments::AttachmentsOperations.new(module_api_name,record_id)
    # Call upload_link_attachment method that takes ParameterMap instance as parameter
    response = ao.upload_link_attachment(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Attachments::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Attachments::SuccessResponse
              success_response = action_response
              # Get the Code
              print "\n code:"
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
            elsif action_response.is_a? Attachments::APIException
              api_exception = action_response
              # Get the Code
              print "\n code:"
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
        elsif action_handler.is_a? Attachments::APIException
          exception = action_handler
          # Get the Code
          print "\n code:"
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
