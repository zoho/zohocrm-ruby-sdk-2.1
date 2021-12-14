require 'ZOHOCRMSDK2_1'

class RelatedRecord
  def self.get_related_records(module_api_name, record_id, related_list_api_name)
    # """
    # This method is used to get the related list records and print the response.
    # :param module_api_name: The API Name of the module to get related records.
    # :param record_id: The ID of the record to be obtain related records
    # :param related_list_api_name: The API name of the related list
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # """
    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters for Get Related Records operation
    pm.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.page, 1)
    pm.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.per_page, 1)
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # hm.add(ZOHOCRMSDK::RelatedRecords::GetRelatedRecordsHeader.If_modified_since,"")
    # Call getRelatedRecords method that takes ParameterMap instance and HeaderMap instance as parameter
    response = rro.get_related_records(record_id, pm, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\n Related Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Related Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Related Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Related Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Related Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Related Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Related Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Related Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Related Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Related Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Related Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Related Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Related Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? ZOHOCRMSDK::Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Related Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Related Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Related Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Related Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Related Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Related Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Related Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Related Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Related Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Related Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Related Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Related Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Related Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Related Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end                  
                  elsif data_list[0].is_a? ZOHOCRMSDK::Tags::Tag
                    tags = data_list
                    tags.each do |tag|
                      # Get the Related Record Tag Name
                      print "\n Related Record Tag Name: "
                      print tag.name
                      # Get the Related Record Tag ID
                      print "\n Related Record Tag ID: "
                      print tag.id.to_s
                    end
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Comment
                    comments = data_list[0]
                    comments.each do |comment|
                      # Get the Related Record CommentedBy
                      print "\n Related Record Comment CommentedBy: "
                      print comment.commented_by
                      # Get the Related Record CommentedTime
                      print "\n Related Record Comment CommentedTime: "
                      print comment.commented_time
                      # Get the Related Record CommentContent
                      print "\n Related Record Comment CommentContent: "
                      print comment.commented_content
                      # Get the Related Record Id
                      print "\n Related Record Comment Id: "
                      print comment.id.to_s
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the RelatedRecord  Description: 
                      print "\n RelatedRecord  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRelatedRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n RelatedRecord  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n RelatedRecord  State:  "
                      print image_upload.state
                      # Get the RelatedRecord  Size: 
                      print "\n RelatedRecord  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRelatedRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n RelatedRecord  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n RelatedRecord  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Attachments::Attachment
                    data_list[0].each do |attachment|
                      # Get the owner User instance of each attachment
                      owner = attachment.owner
                      # Check if owner is not None
                      unless owner.nil?
                        # Get the Id of the Owner
                        print "\n Attachment Owner User-ID:"
                        print owner.id.to_s
                        # Get the Name of the Owner
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
                      # Get the parentId Related Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent Related Record Name of each attachment
                        print "\n Attachment parent Related Record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent Related Record ID of each attachment
                        print "\n Attachment parent Related Record ID: "
                        print parent_id.to_s
                      end
                      # Check if the attachment is Editable
                      print "\n Attachment Editable:"
                      print attachment.editable
                      # Get the file ID of each attachment
                      print "\n Attachment File ID:"
                      print attachment.file_id
                      # Get the type of each attachment
                      print "\n Attachment File Type:"
                      print attachment.type
                      # Get the seModule of each attachmen
                      print "\n Attachment seModule:"
                      print attachment.se_module
                      print "\n"
                      # Get the modifiedBy User instance of each attachment
                      modified_by = attachment.modified_by
                      # Check if modifiedBy is not None
                      unless modified_by.nil?
                        # Get the Name of the modifiedBy User
                        print "\n Attachment Modified User-Name:"
                        print modified_by.name
                        # Get the ID of the modifiedBy User
                        print "\n Attachment Modified User-ID:"
                        print modified_by.id.to_s
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
                      # Get the created_by User instance of each attachment
                      created_by = attachment.created_by
                      # Check if created_by is not None
                      unless created_by.nil?
                        # Get the Name of the CreatedBy User
                        print "\n Attachment Created User-Name:"
                        print created_by.name
                        # Get the ID of the CreatedBy User
                        print "\n Attachment Created User-ID:"
                        print created_by.id.to_s
                        # Get the Email of the CreatedBy User
                        print "\n Attachment Created User-Email:"
                        print created_by.email
                        print "\n"
                      end
                      # Get the linkUrl of each attachment
                      print "\n Attachment LinkUrl"
                      print attachment.link_url
                    end
                    #check if the datatype is Record::PricingDetails
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Related Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Related Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Related Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Related Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Related Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Related Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Related Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Related Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Related Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Related Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Tax
                    tax = data_list[0]

                    print "\n Record Tax Name: " 
                    print  tax.value

                    print "\n Record Tax ID: " 
                    print tax.id
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Related Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Related Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Related Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Related Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? ZOHOCRMSDK::Util::Choice
                    choices = data_list
                    choices.each do |choice|
                      print "\nRecord  "
                      print key_name
                      print choice.value
                    end
                  else
                    print "\n "
                    print key_name
                    print value
                  end
                end
              #check of the value is Layout
              elsif value.is_a? ZOHOCRMSDK::Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + layout.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? ZOHOCRMSDK::Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' User-Name:' + user.name
                  # get the Related Record email
                  print "\n Related Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? ZOHOCRMSDK::Record::Record
                record_value = value
                #check of the Related Record is not null
                unless record_value.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? ZOHOCRMSDK::Record::Consent
                consent = value
                print "\n Related Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Related Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Related Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Related Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Related Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Related Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Related Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Related Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Related Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Related Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Related Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Related Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Related Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Related Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Related Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Related Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Related Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Related Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Related Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? ZOHOCRMSDK::Record::RemindAt
                # Get the alarm of value
                print "\n Related Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? ZOHOCRMSDK::Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? ZOHOCRMSDK::Util::Choice
                choice_value = value
                print "\n Related Record " + key_name + ':' + choice_value.value
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::FileBodyWrapper
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          File.open(stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
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

  def self.update_related_records(module_api_name, record_id, related_list_api_name)
    # """
    # This method is used to update the relation between the records and print the response.
    # :param module_api_name: The API Name of the module to update related record.
    # :param record_id: The ID of the record to be update Related List.
    # :param related_list_api_name: The API name of the related list.
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # """

    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = ZOHOCRMSDK::Record::Record.new

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """
    record.add_key_value('id', 347706112999)
    record.add_key_value('list_price', 50.50)
    # Add Record instance to the list
    records.push(record)
    # Set the list to Records in BodyWrapper instance
    bw.data = records
    # Call update_related_records method that takes record_id and BodyWrapper instance
    response = rro.update_related_records(record_id, bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.delink_records(module_api_name, record_id, related_list_api_name, related_list_ids)
    # """
    # This method is used to delete the association between modules and print the response.
    # :param module_api_name: The API Name of the module to delink related records.
    # :param record_id: The ID of the record
    # :param related_list_api_name: The API name of the related list
    # :param related_list_ids: The list of related record IDs.
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # related_list_ids = ["34096432414001", "34096432414002", "34096432414020"]
    # """

    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new

    related_list_ids.each do |related_id|
      pm.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::DelinkRecordsParam.ids, related_id)
    end
    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
    # Call delink_records method that takes ParameterMap instance as parameter.
    response = rro.delink_records(record_id, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
              # Get the Details
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.get_related_records_using_external_id(module_api_name, external_value, related_list_api_name)
    # """
    # This method is used to get the related list records and print the response.
    # :param module_api_name: The API Name of the module to get related records.
    # :param external_value: 
    # :param related_list_api_name: The API name of the related list
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # """

    x_external = "Leads.External,Products.Products_External"

    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters for Get Related Records operation
    pm.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.page, 1)
    pm.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::GetRelatedRecordsParam.per_page, 1)
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # hm.add(ZOHOCRMSDK::RelatedRecords::GetRelatedRecordsHeader.If_modified_since,"")
    # Call get_related_records_using_external_id method that takes external_value, ParameterMap instance and HeaderMap instance as parameter
    response = rro.get_related_records_using_external_id(external_value, pm, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\n Related Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Related Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Related Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Related Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Related Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Related Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Related Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Related Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Related Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Related Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Related Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Related Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Related Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? ZOHOCRMSDK::Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Related Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Related Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Related Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Related Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Related Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Related Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Related Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Related Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Related Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Related Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Related Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Related Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Related Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Related Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end                  
                  elsif data_list[0].is_a? ZOHOCRMSDK::Tags::Tag
                    tags = data_list
                    tags.each do |tag|
                      # Get the Related Record Tag Name
                      print "\n Related Record Tag Name: "
                      print tag.name
                      # Get the Related Record Tag ID
                      print "\n Related Record Tag ID: "
                      print tag.id.to_s
                    end
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Comment
                    comments = data_list[0]
                    comments.each do |comment|
                      # Get the Related Record CommentedBy
                      print "\n Related Record Comment CommentedBy: "
                      print comment.commented_by
                      # Get the Related Record CommentedTime
                      print "\n Related Record Comment CommentedTime: "
                      print comment.commented_time
                      # Get the Related Record CommentContent
                      print "\n Related Record Comment CommentContent: "
                      print comment.commented_content
                      # Get the Related Record Id
                      print "\n Related Record Comment Id: "
                      print comment.id.to_s
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the RelatedRecord  Description: 
                      print "\n RelatedRecord  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRelatedRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n RelatedRecord  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n RelatedRecord  State:  "
                      print image_upload.state
                      # Get the RelatedRecord  Size: 
                      print "\n RelatedRecord  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRelatedRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n RelatedRecord  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n RelatedRecord  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Attachments::Attachment
                    data_list[0].each do |attachment|
                      # Get the owner User instance of each attachment
                      owner = attachment.owner
                      # Check if owner is not None
                      unless owner.nil?
                        # Get the Id of the Owner
                        print "\n Attachment Owner User-ID:"
                        print owner.id.to_s
                        # Get the Name of the Owner
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
                      # Get the parentId Related Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent Related Record Name of each attachment
                        print "\n Attachment parent Related Record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent Related Record ID of each attachment
                        print "\n Attachment parent Related Record ID: "
                        print parent_id.to_s
                      end
                      # Check if the attachment is Editable
                      print "\n Attachment Editable:"
                      print attachment.editable
                      # Get the file ID of each attachment
                      print "\n Attachment File ID:"
                      print attachment.file_id
                      # Get the type of each attachment
                      print "\n Attachment File Type:"
                      print attachment.type
                      # Get the seModule of each attachmen
                      print "\n Attachment seModule:"
                      print attachment.se_module
                      print "\n"
                      # Get the modifiedBy User instance of each attachment
                      modified_by = attachment.modified_by
                      # Check if modifiedBy is not None
                      unless modified_by.nil?
                        # Get the Name of the modifiedBy User
                        print "\n Attachment Modified User-Name:"
                        print modified_by.name
                        # Get the ID of the modifiedBy User
                        print "\n Attachment Modified User-ID:"
                        print modified_by.id.to_s
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
                      # Get the created_by User instance of each attachment
                      created_by = attachment.created_by
                      # Check if created_by is not None
                      unless created_by.nil?
                        # Get the Name of the CreatedBy User
                        print "\n Attachment Created User-Name:"
                        print created_by.name
                        # Get the ID of the CreatedBy User
                        print "\n Attachment Created User-ID:"
                        print created_by.id.to_s
                        # Get the Email of the CreatedBy User
                        print "\n Attachment Created User-Email:"
                        print created_by.email
                        print "\n"
                      end
                      # Get the linkUrl of each attachment
                      print "\n Attachment LinkUrl"
                      print attachment.link_url
                    end
                    #check if the datatype is Record::PricingDetails
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Related Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Related Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Related Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Related Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Related Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Related Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Related Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Related Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Related Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Related Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Tax
                    tax = data_list[0]

                    print "\n Record Tax Name: " 
                    print  tax.value

                    print "\n Record Tax ID: " 
                    print tax.id
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Related Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Related Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Related Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Related Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? ZOHOCRMSDK::Util::Choice
                    choices = data_list
                    choices.each do |choice|
                      print "\nRecord  "
                      print key_name
                      print choice.value
                    end
                  else
                    print "\n "
                    print key_name
                    print value
                  end
                end
              #check of the value is Layout
              elsif value.is_a? ZOHOCRMSDK::Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + layout.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? ZOHOCRMSDK::Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' User-Name:' + user.name
                  # get the Related Record email
                  print "\n Related Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? ZOHOCRMSDK::Record::Record
                record_value = value
                #check of the Related Record is not null
                unless record_value.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? ZOHOCRMSDK::Record::Consent
                consent = value
                print "\n Related Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Related Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Related Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Related Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Related Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Related Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Related Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Related Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Related Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Related Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Related Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Related Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Related Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Related Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Related Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Related Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Related Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Related Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Related Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? ZOHOCRMSDK::Record::RemindAt
                # Get the alarm of value
                print "\n Related Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? ZOHOCRMSDK::Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? ZOHOCRMSDK::Util::Choice
                choice_value = value
                print "\n Related Record " + key_name + ':' + choice_value.value
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::FileBodyWrapper
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          File.open(stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
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

  def self.update_related_records_using_external_id(module_api_name, external_value, related_list_api_name)
    # """
    # This method is used to update the relation between the records and print the response.
    # :param module_api_name: The API Name of the module to update related record.
    # :param external_value: 
    # :param related_list_api_name: The API name of the related list.
    # """

    # """
    # example
    # module_api_name = "Products"
    # external_value = 
    # related_list_api_name = "Price_Books"
    # """

    x_external = "Leads.External,Products.Products_External"

    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = ZOHOCRMSDK::Record::Record.new

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """
    record.add_key_value('Products_External', "ProductExternal")
    record.add_key_value('list_price', 50.50)
    # Add Record instance to the list
    records.push(record)
    # Set the list to Records in BodyWrapper instance
    bw.data = records
    # Call update_related_records_using_external_id method that takes external_value and BodyWrapper instance
    response = rro.update_related_records_using_external_id(external_value, bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.delete_related_records_using_external_id(module_api_name, external_value, related_list_api_name, related_list_ids)
    # """
    # This method is used to delete the association between modules and print the response.
    # :param module_api_name: The API Name of the module to delink related records.
    # :param external_value: 
    # :param related_list_api_name: The API name of the related list
    # :param related_list_ids: The list of related record IDs.
    # """

    # """
    # example
    # module_api_name = "Products"
    # external_value = "34096430798007"
    # related_list_api_name = "Price_Books"
    # related_list_ids = ["34096432414001", "34096432414002", "34096432414020"]
    # """

    x_external = "Leads.External,Products.Products_External"

    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new

    related_list_ids.each do |related_id|
      pm.add(ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations::DelinkRecordsParam.ids, related_id)
    end
    # Get instance of RelatedRecordsOperations Class that takes related_list_api_name, module_api_name and x_external as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
    # Call delete_related_records_using_external_id method that takes ParameterMap instance as parameter.
    response = rro.delete_related_records_using_external_id(external_value, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
              # Get the Details
              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.get_related_record(module_api_name, record_id, related_list_api_name, related_record_id, destination_folder)
    # """
    # This method is used to get the single related list record and print the response.
    # :param module_api_name: The API Name of the module to get related record.
    # :param record_id: The ID of the record to be get Related List.
    # :param related_list_api_name: The API name of the related list.
    # :param related_list_id: The ID of the related record.
    # :param destination_folder : The absolute path of the destination folder to store the related record
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # related_list_id = "34096432414001"
    # destination_folder = "/Users/user_name/Desktop"
    # """

    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName, recordId and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # Possible headers for Get Related Records operation
    # hm.add(ZOHOCRMSDK::RelatedRecords::GetRelatedRecordsHeader.If_modified_since,"")
    # Call getRelatedRecord method that takes header_instance and related_list_id as parameter
    response = rro.get_related_record(related_record_id, record_id, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\n Related Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Related Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Related Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Related Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Related Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Related Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Related Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Related Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Related Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Related Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Related Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Related Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Related Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? ZOHOCRMSDK::Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Related Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Related Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Related Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Related Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Related Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Related Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Related Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Related Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Related Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Related Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Related Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Related Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Related Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Related Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end                  
                  elsif data_list[0].is_a? ZOHOCRMSDK::Tags::Tag
                    tags = data_list
                    tags.each do |tag|
                      # Get the Related Record Tag Name
                      print "\n Related Record Tag Name: "
                      print tag.name
                      # Get the Related Record Tag ID
                      print "\n Related Record Tag ID: "
                      print tag.id.to_s
                    end
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Comment
                    comments = data_list[0]
                    comments.each do |comment|
                      # Get the Related Record CommentedBy
                      print "\n Related Record Comment CommentedBy: "
                      print comment.commented_by
                      # Get the Related Record CommentedTime
                      print "\n Related Record Comment CommentedTime: "
                      print comment.commented_time
                      # Get the Related Record CommentContent
                      print "\n Related Record Comment CommentContent: "
                      print comment.commented_content
                      # Get the Related Record Id
                      print "\n Related Record Comment Id: "
                      print comment.id.to_s
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the RelatedRecord  Description: 
                      print "\n RelatedRecord  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRelatedRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n RelatedRecord  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n RelatedRecord  State:  "
                      print image_upload.state
                      # Get the RelatedRecord  Size: 
                      print "\n RelatedRecord  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRelatedRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n RelatedRecord  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n RelatedRecord  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Attachments::Attachment
                    data_list[0].each do |attachment|
                      # Get the owner User instance of each attachment
                      owner = attachment.owner
                      # Check if owner is not None
                      unless owner.nil?
                        # Get the Id of the Owner
                        print "\n Attachment Owner User-ID:"
                        print owner.id.to_s
                        # Get the Name of the Owner
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
                      # Get the parentId Related Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent Related Record Name of each attachment
                        print "\n Attachment parent Related Record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent Related Record ID of each attachment
                        print "\n Attachment parent Related Record ID: "
                        print parent_id.to_s
                      end
                      # Check if the attachment is Editable
                      print "\n Attachment Editable:"
                      print attachment.editable
                      # Get the file ID of each attachment
                      print "\n Attachment File ID:"
                      print attachment.file_id
                      # Get the type of each attachment
                      print "\n Attachment File Type:"
                      print attachment.type
                      # Get the seModule of each attachmen
                      print "\n Attachment seModule:"
                      print attachment.se_module
                      print "\n"
                      # Get the modifiedBy User instance of each attachment
                      modified_by = attachment.modified_by
                      # Check if modifiedBy is not None
                      unless modified_by.nil?
                        # Get the Name of the modifiedBy User
                        print "\n Attachment Modified User-Name:"
                        print modified_by.name
                        # Get the ID of the modifiedBy User
                        print "\n Attachment Modified User-ID:"
                        print modified_by.id.to_s
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
                      # Get the created_by User instance of each attachment
                      created_by = attachment.created_by
                      # Check if created_by is not None
                      unless created_by.nil?
                        # Get the Name of the CreatedBy User
                        print "\n Attachment Created User-Name:"
                        print created_by.name
                        # Get the ID of the CreatedBy User
                        print "\n Attachment Created User-ID:"
                        print created_by.id.to_s
                        # Get the Email of the CreatedBy User
                        print "\n Attachment Created User-Email:"
                        print created_by.email
                        print "\n"
                      end
                      # Get the linkUrl of each attachment
                      print "\n Attachment LinkUrl"
                      print attachment.link_url
                    end
                    #check if the datatype is Record::PricingDetails
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Related Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Related Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Related Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Related Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Related Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Related Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Related Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Related Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Related Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Related Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Tax
                    tax = data_list[0]

                    print "\n Record Tax Name: " 
                    print  tax.value

                    print "\n Record Tax ID: " 
                    print tax.id
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Related Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Related Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Related Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Related Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? ZOHOCRMSDK::Util::Choice
                    choices = data_list
                    choices.each do |choice|
                      print "\nRecord  "
                      print key_name
                      print choice.value
                    end
                  else
                    print "\n "
                    print key_name
                    print value
                  end
                end
              #check of the value is Layout
              elsif value.is_a? ZOHOCRMSDK::Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + layout.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? ZOHOCRMSDK::Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' User-Name:' + user.name
                  # get the Related Record email
                  print "\n Related Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? ZOHOCRMSDK::Record::Record
                record_value = value
                #check of the Related Record is not null
                unless record_value.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? ZOHOCRMSDK::Record::Consent
                consent = value
                print "\n Related Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Related Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Related Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Related Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Related Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Related Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Related Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Related Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Related Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Related Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Related Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Related Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Related Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Related Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Related Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Related Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Related Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Related Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Related Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? ZOHOCRMSDK::Record::RemindAt
                # Get the alarm of value
                print "\n Related Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? ZOHOCRMSDK::Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? ZOHOCRMSDK::Util::Choice
                choice_value = value
                print "\n Related Record " + key_name + ':' + choice_value.value
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::FileBodyWrapper
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          File.open(stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
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

  def self.update_related_record(module_api_name, record_id, related_list_api_name, related_record_id)
    # """
    # This method is used to update a single related record with ID and print the response.
    # :param module_api_name: The API Name of the module to update related record.
    # :param record_id: The ID of the record
    # :param related_list_api_name: The API name of the related list.
    # :param related_list_id: The ID of the related record.
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # related_list_id = "34096432414001"
    # """
    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = ZOHOCRMSDK::Record::Record.new

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """
    record.add_key_value('id', 347706110031010)
    record.add_key_value('list_price', 50.40)
    # Add Record instance to the list
    records.push(record)
    # Set the list to Records in BodyWrapper instance
    bw.data = records
    # Call update_related_records method that takes related_record_id, record_id and BodyWrapper instance as parameter.
    response = rro.update_related_record(related_record_id, record_id, bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.delink_record(module_api_name, record_id, related_list_api_name, related_record_id)
    # """
    # This method is used to delete the association between modules and print the response.s
    # :param module_api_name: The API Name of the module to delink related record.
    # :param record_id: The ID of the record
    # :param related_list_api_name: The API name of the related list.
    # :param related_list_id: The ID of the related record.
    # """

    # """
    # example
    # module_api_name = "Products"
    # record_id = "34096430798007"
    # related_list_api_name = "Price_Books"
    # related_list_id = "34096432414001"
    # """
    # Get instance of RelatedRecordsOperations Class that takes moduleAPIName and relatedListAPIName as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name)
    # Call delink_record method that takes related_list_id and record_id as parameter.
    response = rro.delink_record(related_record_id, record_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.get_related_record_using_external_id(module_api_name, external_value, related_list_api_name, external_field_value, destination_folder)
    # """
    # This method is used to get the single related list record and print the response.
    # :param module_api_name: The API Name of the module to get related record.
    # :param external_value: 
    # :param related_list_api_name: The API name of the related list.
    # :param external_field_value: 
    # :param destination_folder : The absolute path of the destination folder to store the related record
    # """

    # """
    # example
    # module_api_name = "Products"
    # external_value = "34096430798007"
    # related_list_api_name = "Price_Books"
    # external_field_value = "34096432414001"
    # destination_folder = "/Users/user_name/Desktop"
    # """

    x_external = "Leads.External,Products.Products_External"

    # Get instance of RelatedRecordsOperations Class that takes related_list_api_name, module_api_name and x_external as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # Possible headers for Get Related Records operation
    # hm.add(ZOHOCRMSDK::RelatedRecords::GetRelatedRecordsHeader.If_modified_since,"")
    # Call get_related_record_using_external_id method that takes external_field_value, external_value and header_instance as parameter
    response = rro.get_related_record_using_external_id(external_field_value, external_value, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::RelatedRecords::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\n Related Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Related Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Related Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Related Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Related Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Related Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Related Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Related Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Related Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Related Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Related Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Related Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Related Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? ZOHOCRMSDK::Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Related Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Related Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Related Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Related Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Related Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Related Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Related Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Related Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Related Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Related Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Related Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Related Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Related Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Related Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end                  
                  elsif data_list[0].is_a? ZOHOCRMSDK::Tags::Tag
                    tags = data_list
                    tags.each do |tag|
                      # Get the Related Record Tag Name
                      print "\n Related Record Tag Name: "
                      print tag.name
                      # Get the Related Record Tag ID
                      print "\n Related Record Tag ID: "
                      print tag.id.to_s
                    end
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Comment
                    comments = data_list[0]
                    comments.each do |comment|
                      # Get the Related Record CommentedBy
                      print "\n Related Record Comment CommentedBy: "
                      print comment.commented_by
                      # Get the Related Record CommentedTime
                      print "\n Related Record Comment CommentedTime: "
                      print comment.commented_time
                      # Get the Related Record CommentContent
                      print "\n Related Record Comment CommentContent: "
                      print comment.commented_content
                      # Get the Related Record Id
                      print "\n Related Record Comment Id: "
                      print comment.id.to_s
                    end
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the RelatedRecord  Description: 
                      print "\n RelatedRecord  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRelatedRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n RelatedRecord  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n RelatedRecord  State:  "
                      print image_upload.state
                      # Get the RelatedRecord  Size: 
                      print "\n RelatedRecord  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRelatedRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n RelatedRecord  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n RelatedRecord  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? ZOHOCRMSDK::Attachments::Attachment
                    data_list[0].each do |attachment|
                      # Get the owner User instance of each attachment
                      owner = attachment.owner
                      # Check if owner is not None
                      unless owner.nil?
                        # Get the Id of the Owner
                        print "\n Attachment Owner User-ID:"
                        print owner.id.to_s
                        # Get the Name of the Owner
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
                      # Get the parentId Related Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent Related Record Name of each attachment
                        print "\n Attachment parent Related Record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent Related Record ID of each attachment
                        print "\n Attachment parent Related Record ID: "
                        print parent_id.to_s
                      end
                      # Check if the attachment is Editable
                      print "\n Attachment Editable:"
                      print attachment.editable
                      # Get the file ID of each attachment
                      print "\n Attachment File ID:"
                      print attachment.file_id
                      # Get the type of each attachment
                      print "\n Attachment File Type:"
                      print attachment.type
                      # Get the seModule of each attachmen
                      print "\n Attachment seModule:"
                      print attachment.se_module
                      print "\n"
                      # Get the modifiedBy User instance of each attachment
                      modified_by = attachment.modified_by
                      # Check if modifiedBy is not None
                      unless modified_by.nil?
                        # Get the Name of the modifiedBy User
                        print "\n Attachment Modified User-Name:"
                        print modified_by.name
                        # Get the ID of the modifiedBy User
                        print "\n Attachment Modified User-ID:"
                        print modified_by.id.to_s
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
                      # Get the created_by User instance of each attachment
                      created_by = attachment.created_by
                      # Check if created_by is not None
                      unless created_by.nil?
                        # Get the Name of the CreatedBy User
                        print "\n Attachment Created User-Name:"
                        print created_by.name
                        # Get the ID of the CreatedBy User
                        print "\n Attachment Created User-ID:"
                        print created_by.id.to_s
                        # Get the Email of the CreatedBy User
                        print "\n Attachment Created User-Email:"
                        print created_by.email
                        print "\n"
                      end
                      # Get the linkUrl of each attachment
                      print "\n Attachment LinkUrl"
                      print attachment.link_url
                    end
                    #check if the datatype is Record::PricingDetails
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Related Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Related Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Related Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Related Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Related Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Related Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Related Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Related Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Related Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Related Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::Tax
                    tax = data_list[0]

                    print "\n Record Tax Name: " 
                    print  tax.value

                    print "\n Record Tax ID: " 
                    print tax.id
                  elsif data_list[0].is_a? ZOHOCRMSDK::Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Related Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Related Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Related Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Related Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? ZOHOCRMSDK::Util::Choice
                    choices = data_list
                    choices.each do |choice|
                      print "\nRecord  "
                      print key_name
                      print choice.value
                    end
                  else
                    print "\n "
                    print key_name
                    print value
                  end
                end
              #check of the value is Layout
              elsif value.is_a? ZOHOCRMSDK::Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + layout.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? ZOHOCRMSDK::Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' User-Name:' + user.name
                  # get the Related Record email
                  print "\n Related Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? ZOHOCRMSDK::Record::Record
                record_value = value
                #check of the Related Record is not null
                unless record_value.nil?
                  # get the Related Record id
                  print "\n Related Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the Related Record name
                  print "\n Related Record " + key_name + ' Name:' + record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? ZOHOCRMSDK::Record::Consent
                consent = value
                print "\n Related Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Related Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Related Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Related Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Related Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Related Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Related Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Related Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Related Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Related Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Related Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Related Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Related Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Related Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Related Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Related Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Related Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Related Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Related Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Related Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? ZOHOCRMSDK::Record::RemindAt
                # Get the alarm of value
                print "\n Related Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? ZOHOCRMSDK::Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? ZOHOCRMSDK::Util::Choice
                choice_value = value
                print "\n Related Record " + key_name + ':' + choice_value.value
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedRecords::FileBodyWrapper
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          File.open(stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
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

  def self.update_related_record_using_external_id(module_api_name, external_value, related_list_api_name, external_field_value)
    # """
    # This method is used to update a single related record with ID and print the response.
    # :param module_api_name: The API Name of the module to update related record.
    # :param external_value: 
    # :param related_list_api_name: The API name of the related list.
    # :param external_field_value: 
    # """

    # """
    # example
    # module_api_name = "Products"
    # external_value = "34096430798007"
    # related_list_api_name = "Price_Books"
    # external_field_value = "34096432414001"
    # """

    x_external = "Leads.External,Products.Products_External"

    # Get instance of RelatedRecordsOperations Class that takes related_list_api_name, module_api_name and x_external as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::RelatedRecords::BodyWrapper.new
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = ZOHOCRMSDK::Record::Record.new

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """
    record.add_key_value('list_price', 50.40)
    # Add Record instance to the list
    records.push(record)
    # Set the list to Records in BodyWrapper instance
    bw.data = records
    # Call update_related_record_using_external_id method that takes related_record_id, record_id and BodyWrapper instance as parameter.
    response = rro.update_related_record_using_external_id(external_field_value, external_value, bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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

  def self.delete_related_record_using_external_id(module_api_name, external_value, related_list_api_name, external_field_value)
    # """
    # This method is used to delete the association between modules and print the response.s
    # :param module_api_name: The API Name of the module to delink related record.
    # :param external_value:
    # :param related_list_api_name: The API name of the related list.
    # :param external_field_value: 
    # """

    # """
    # example
    # module_api_name = "Products"
    # external_value = "34096430798007"
    # related_list_api_name = "Price_Books"
    # external_field_value = "34096432414001"
    # """

    x_external = "Leads.External,Products.Products_External"

    # Get instance of RelatedRecordsOperations Class that takes related_list_api_name, module_api_name and x_external as parameter
    rro = ZOHOCRMSDK::RelatedRecords::RelatedRecordsOperations.new(related_list_api_name, module_api_name, x_external)
    # Call delete_related_record_using_external_id method that takes related_list_id and record_id as parameter.
    response = rro.delete_related_record_using_external_id(external_field_value, external_value)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        if action_handler.is_a? ZOHOCRMSDK::RelatedRecords::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::RelatedRecords::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::RelatedRecords::APIException
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
