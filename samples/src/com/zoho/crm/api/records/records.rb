require 'ZCRMSDK'
require 'date'

class Records
  def self.get_record(module_api_name, record_id)
    # """
    # This method is used to get all the records of a module and print the response.
    # :param module_api_name: The API Name of the module to fetch records
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # """
    # Get instance of RecordOperations Class
    ro = Record::RecordOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # module_api_name = "Leads"
    # record_id = 305662018
    # pm.add(Record::RecordOperations::GetRecordParam.approved,"false")
    # pm.add(Record::RecordOperations::GetRecordParam.converted,"false")
    # field_names =["Company","Email"]
    # field_names.each do |field_name|
    #     pm.add(Record::::RecordOperations::GetRecordParam.fields,field_name)
    # end
    # Get instance of HeaderMap Class
    hm = HeaderMap.new
    # hm.add(Record::RecordOperations::GetRecordHeader.If_modified_since,"")
    # Call getRecord method that takes param_instance, header_instance, module_api_name and record_id as parameter
    response = ro.get_record(record_id,module_api_name,pm, hm)
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
        if response_handler.is_a? Record::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\n Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end
                  elsif data_list[0].is_a? Record::Tax
                    tax = data_list[0]
                      # Get the Record Tax Value
                      print "\n Record Tax Value: "
                      print tax.value
                      # Get the Record Tax ID
                      print "\n Record Tax ID: "
                      print tax.id.to_s
                  elsif data_list[0].is_a? Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the Record  Description: 
                      print "\n Record  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n Record  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n Record  State:  "
                      print image_upload.state
                      # Get the Record  Size: 
                      print "\n Record  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n Record  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n Record  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Tags::Tag
                  elsif data_list[0].is_a? Tags::Tag
                    tags = data_list
                    tags.each do |tag|
                      # Get the Record Tag Name
                      print "\n Record Tag Name: "
                      print tag.name
                      # Get the Record Tag ID
                      print "\n Record Tag ID: "
                      print tag.id.to_s
                    end
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? Record::Comment
                    comments = data_list
                    unless comments.nil?
                      comments.each do |comment|
                        # Get the Record CommentedBy
                        print "\n Record Comment CommentedBy: "
                        print comment.commented_by
                        # Get the Record CommentedTime
                        print "\n Record Comment CommentedTime: "
                        print comment.commented_time
                        # Get the Record CommentContent
                        print "\n Record Comment CommentContent: "
                        print comment.comment_content
                        # Get the Record Id
                        print "\n Record Comment Id: "
                        print comment.id.to_s
                      end
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? Attachments::Attachment
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
                      # Get the parentId Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent record Name of each attachment
                        print "\n Attachment parent record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent record ID of each attachment
                        print "\n Attachment parent record ID: "
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
                  elsif data_list[0].is_a? Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? Util::Choice
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
              elsif value.is_a? Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the record id
                  print "\n Record " + key_name + ' ID:' + layout.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the record id
                  print "\n Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' User-Name:' + user.name
                  # get the record email
                  print "\n Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? Record::Record
                record_value = value
                #check of the record is not null
                unless record_value.nil?
                  # get the record id
                  print "\n Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' Name:' + record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? Record::Consent
                consent = value
                print "\n Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? Record::RemindAt
                # Get the alarm of value
                print "\n Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? Util::Choice
                choice_value = value
                print "\n Record " + key_name + ':' + choice_value.value
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Record::APIException
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

  def self.update_record(module_api_name, record_id)
    # """
    # This method is used to update a single record of a module with ID and print the response.
    # :param module_api_name: The API Name of the record's module.
    # :param record_id: The ID of the record to be updated
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # record_id = 347706106603276
    # """
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = Record::Record.new

    # """
    # Call add_field_value method that takes two arguments
    # 1 -> Call Field "::" and choose the module from the displayed list and press "." and choose the field name from the displayed list.
    # 2 -> Value
    # """
    if module_api_name.downcase == 'Leads'.downcase
      record.add_field_value(Record::Field::Leads.Last_name, 'asdad')
      record.add_field_value(Record::Field::Leads.City, 'City')
      record.add_field_value(Record::Field::Leads.First_name, 'First Name')
      record.add_field_value(Record::Field::Leads.Company, 'KKRNP')
    end

    # file = Record::FileDetails.new
    # file.file_id = "f46166fa14ce16c6e2622b3ce82830759c6334275dc8a317539bbda39a6ca056"
    # files = [file]

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """

    if module_api_name == 'Contacts'
      file_details = []

      file_detail =  Record::FileDetails.new

      file_detail.file_id = '479f0f5eebf0fb982f99e3832b35d23e29f67c2868ee4c789f22579895383c8'

      file_details.push(file_detail)

      record.add_key_value('File_Upload_1', file_details)
    end

    # """
    # Following methods are being used only by Inventory modules
    # """
    if %w[Quotes Sales_Orders Purchase_Orders Invoices].include? module_api_name
      line_item_product = Record::LineItemProduct.new
      line_item_product.id = 3_477_061_000_005_356_009
      inventory_line_item = Record::InventoryLineItems.new
      inventory_line_item.product = line_item_product
      inventory_line_item.list_price = 10.0
      inventory_line_item.discount = '5.0'
      inventory_line_item.quantity = 123.2
      line_tax = Record::LineTax.new
      line_tax.name = 'Tax1'
      line_tax.percentage = 20.0
      line_taxes = [line_tax]
      inventory_line_item.line_tax = line_taxes
      inventory_line_items = [inventory_line_item]
      record.add_key_value('Product_Details', inventory_line_items)
      record.add_key_value('Subject', 'asd')
    end
    # """
    # Following methods are being used only by Activity modules
    # """
    if %w[Tasks Events Calls].include? module_api_name
      remind_at = Record::RemindAt.new
      remind_at.alarm = 'FREQ=NONE;ACTION=EMAILANDPOPUP;TRIGGER=DATE-TIME:2020-07-03T12:30:00+05:30'
      who_id =  Record::Record.new
      who_id.id = 3_524_033_000_003_429_023
      record.add_field_value(Record::Field::Tasks.Who_id, who_id)

      participant_record = Record::Participants.new
      participant_record.participant = 'asdasd@gmail.com'
      participant_record.type = 'email'
      record.add_field_value(Record::Field::Events.Event_title, 'New Automated Event')
      endtime = DateTime.new(2019, 8, 10, 4, 11, 9, '+03:00')
      record.add_field_value(Record::Field::Events.End_datetime, endtime)
      starttime = DateTime.new(2019, 8, 10, 4, 10, 9, '+03:00')
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      participants = [participant_record]
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      recurring_activity = Record::RecurringActivity.new

      recurring_activity.rrule = 'FREQ=DAILY;INTERVAL=10;UNTIL=2020-08-14;DTSTART=2020-07-03'
      record.add_field_value(Record::Field::Events.Recurring_activity, recurring_activity)
    end

    if module_api_name == 'Price_Books'
      pricing_detail_record = Record::PricingDetails.new
      pricing_detail_record.from_range = 1.0
      pricing_detail_record.to_range = 1.0
      pricing_detail_record.discount = 1.0
      pricing_detail_records = [pricing_detail_record]
      record.add_key_value('Price_Book_Name', 'assd')
      record.add_field_value(Record::Field::Price_Books.Pricing_details, pricing_detail_records)
      record.add_field_value(Record::Field::Price_Books.Pricing_model, Util::Choice.new('Flat'))
    end
    # # Get instance of BodyWrapper Class that will contain the request body
    records.push(record)
    trigger = []
    trigger.push('approval')

    trigger.push('workflow')

    trigger.push('blueprint')
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = Record::BodyWrapper.new
    # Set the list to data in BodyWrapper instance
    body_wrapper.data = records
    # Set the lar_id in BodyWrapper instance
    body_wrapper.lar_id = '213123131'
    #set trigger
    body_wrapper.trigger = trigger
    process = ['review_process']
    # body_wrapper.process = process
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call updateRecord method that takes BodyWrapper instance, module_api_name and record_id as parameter
    response = rr.update_record(record_id , module_api_name,body_wrapper )
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? Record::SuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.delete_record(module_api_name, record_id)
    # """
    # This method is used to delete a single record of a module with ID and print the response.
    # :param module_api_name: The API Name of the record's module.
    # :param record_id: The ID of the record to be deleted
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # record_id = 347706106603276
    # """
    records = []
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    pm.add(Record::RecordOperations::DeleteRecordParam.wf_trigger, "false")
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call deleteRecord method that takes param_instance, module_api_name and record_id as parameter.
    response = rr.delete_record(record_id, module_api_name, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? Record::SuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.get_records(module_api_name)
    # """
    # This method is used to get all the records of a module and print the response.
    # :param module_api_name: The API Name of the module to fetch records
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # """
    # Get instance of RecordOperations Class
    ro = Record::RecordOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # record_id = 305495066
    # Add the per_page to ParameterMap instance
    # pm.add(Record::RecordOperations::GetRecordsParam.per_page, 1)
    # pm.add(Record::RecordOperations::GetRecordsParam.converted, 'false')
    # field_names =["Company","Email"]
    # field_names.each do |field_name|
    #     pm.add(Record::::RecordOperations::GetRecordParam.fields,field_name)
    # end
    # Get instance of HeaderMap Class
    hm = HeaderMap.new
    # hm.add(Record::RecordOperations::GetRecordHeader.If_modified_since,"")
    # Call getRecords method that takes ParameterMap Instance, HeaderMap Instance and module_api_name as parameters
    response = ro.get_records(module_api_name,pm, hm)
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
        if response_handler.is_a? Record::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            Records.get_record(module_api_name, record.id)
            # Get the ID of each Record
            print "\n Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end
                  elsif data_list[0].is_a? Record::Tax
                    tax = data_list[0]
                      # Get the Record Tax Value
                      print "\n Record Tax Value: "
                      print tax.value
                      # Get the Record Tax ID
                      print "\n Record Tax ID: "
                      print tax.id.to_s
                  elsif data_list[0].is_a? Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the Record  Description: 
                      print "\n Record  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n Record  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n Record  State:  "
                      print image_upload.state
                      # Get the Record  Size: 
                      print "\n Record  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n Record  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n Record  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? Record::Comment
                    comments = data_list
                    unless comments.nil?
                      comments.each do |comment|
                        # Get the Record CommentedBy
                        print "\n Record Comment CommentedBy: "
                        print comment.commented_by
                        # Get the Record CommentedTime
                        print "\n Record Comment CommentedTime: "
                        print comment.commented_time
                        # Get the Record CommentContent
                        print "\n Record Comment CommentContent: "
                        print comment.comment_content
                        # Get the Record Id
                        print "\n Record Comment Id: "
                        print comment.id.to_s
                      end
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? Attachments::Attachment
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
                      # Get the parentId Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent record Name of each attachment
                        print "\n Attachment parent record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent record ID of each attachment
                        print "\n Attachment parent record ID: "
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
                  elsif data_list[0].is_a? Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? Util::Choice
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
              elsif value.is_a? Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the record id
                  print "\n Record " + key_name + ' ID:' + layout.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the record id
                  print "\n Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' User-Name:' + user.name
                  # get the record email
                  print "\n Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? Record::Record
                record_value = value
                #check of the record is not null
                unless record_value.nil?
                  # get the record id
                  print "\n Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' Name:'
                  print record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? Record::Consent
                consent = value
                print "\n Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? Record::RemindAt
                # Get the alarm of value
                print "\n Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? Util::Choice
                choice_value = value
                print "\n Record " + key_name + ':' + choice_value.value
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
              print "\n Record Info Per page: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Record Info Count: "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n Record Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n Record Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Record::APIException
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

  def self.create_records(module_api_name)
    # """
    # This method is used to create records of a module and print the response.
    # :param module_api_name: The API Name of the module to create records.
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # """
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = Record::Record.new
    # """
    # Call add_field_value method that takes two arguments
    # 1 -> Call Field "::" and choose the module from the displayed list and press "." and choose the field name from the displayed list.
    # 2 -> Value
    # """
    if module_api_name.downcase == 'Leads'.downcase
      record.add_field_value(Record::Field::Leads.Last_name, 'asdad')
      record.add_field_value(Record::Field::Leads.City, 'City')
      record.add_field_value(Record::Field::Leads.First_name, 'First Name')
      record.add_field_value(Record::Field::Leads.Company, 'KKRNP')
    end

    # file = Record::FileDetails.new
    # file.file_id = "f46166fa14ce16c6e2622b3ce82830759c6334275dc8a317539bbda39a6ca056"
    # files = [file]

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """

    if module_api_name == 'Contacts'
      file_details = []

      file_detail =  Record::FileDetails.new

      file_detail.file_id = '479f0f5eebf0fb982f99e3832b35d23e29f67c2868ee4c789f22579895383c8'

      file_details.push(file_detail)

      record.add_key_value('File_Upload_1', file_details)
    end

    # """
    # Following methods are being used only by Inventory modules
    # """
    if %w[Quotes Sales_Orders Purchase_Orders Invoices].include? module_api_name
      line_item_product = Record::LineItemProduct.new
      line_item_product.id = 0151033
      inventory_line_item = Record::Record.new
      inventory_line_item.add_key_value("Product_Name", line_item_product)
      inventory_line_item.add_key_value("ListPrice", 10.0)
      inventory_line_item.add_key_value("Discount", '5.0')
      inventory_line_item.add_key_value("Quantity", 123.2)
      line_tax = Record::LineTax.new
      line_tax.name = 'MyTax11342'
      line_tax.percentage = 20.0
      line_taxes = [line_tax]
      inventory_line_item.add_key_value("Line_Tax", line_taxes)
      inventory_line_items = [inventory_line_item]
      record.add_key_value('Quoted_Items', inventory_line_items)
      record.add_key_value('Subject', 'asd')
    end
    # """
    # Following methods are being used only by Activity modules
    # """
    if %w[Tasks Events Calls].include? module_api_name
      remind_at = Record::RemindAt.new
      remind_at.alarm = 'FREQ=NONE;ACTION=EMAILANDPOPUP;TRIGGER=DATE-TIME:2020-07-03T12:30:00+05:30'
      who_id =  Record::Record.new
      who_id.id = 347706107635005
      record.add_field_value(Record::Field::Tasks.Who_id, who_id)
      participant_record = Record::Participants.new
      participant_record.participant = 'asdasd@gmail.com'
      participant_record.type = 'email'
      record.add_field_value(Record::Field::Events.Event_title, 'New Automated Event')
      endtime = DateTime.new(2019, 8, 10, 4, 11, 9, '+03:00')
      record.add_field_value(Record::Field::Events.End_datetime, endtime)
      starttime = DateTime.new(2019, 8, 10, 4, 10, 9, '+03:00')
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      participants = [participant_record]
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      recurring_activity = Record::RecurringActivity.new

      recurring_activity.rrule = 'FREQ=DAILY;INTERVAL=10;UNTIL=2021-08-14;DTSTART=2020-07-03'
      record.add_field_value(Record::Field::Events.Recurring_activity, recurring_activity)
      record.add_key_value('Subject', 'asd')
      record.add_field_value(Record::Field::Calls.Call_type, Util::Choice.new('Outbound'))
      record.add_field_value(Record::Field::Calls.Call_start_time, DateTime.new(2019, 8, 10, 4, 10, 9, '+03:00'))
    end

    if module_api_name == 'Price_Books'
      pricing_detail_record = Record::PricingDetails.new
      pricing_detail_record.from_range = 1.0
      pricing_detail_record.to_range = 1.0
      pricing_detail_record.discount = 1.0
      pricing_detail_records = [pricing_detail_record]
      record.add_key_value('Price_Book_Name', 'assd')
      record.add_field_value(Record::Field::Price_Books.Pricing_details, pricing_detail_records)
      record.add_field_value(Record::Field::Price_Books.Pricing_model, Util::Choice.new('Flat'))
    end
    # # Get instance of BodyWrapper Class that will contain the request body
    records.push(record)
    trigger = []
    trigger.push('approval')

    trigger.push('workflow')

    trigger.push('blueprint')
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = Record::BodyWrapper.new
    # Set the list to data in BodyWrapper instance
    body_wrapper.data = records
    # Set the lar_id in BodyWrapper instance
    body_wrapper.lar_id = '213123131'
    #set trigger
    body_wrapper.trigger = trigger
    process = ['review_process']
    # body_wrapper.process = process
    # # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call create_records method that takes BodyWrapper instance and module_api_name as parameters
    response = rr.create_records(module_api_name,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? Record::SuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.update_records(module_api_name)
    # """
    # This method is used to update the records of a module with ID and print the response.
    # :param module_api_name: The API Name of the module to update records.
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # """
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = Record::Record.new
    # """
    # Call add_field_value method that takes two arguments
    # 1 -> Call Field "::" and choose the module from the displayed list and press "." and choose the field name from the displayed list.
    # 2 -> Value
    # """
    if module_api_name.downcase == 'Leads'.downcase
      record.add_field_value(Record::Field::Leads.Last_name, 'asdad')
      record.add_field_value(Record::Field::Leads.City, 'City')
      record.add_field_value(Record::Field::Leads.First_name, 'First Name')
      record.add_field_value(Record::Field::Leads.Company, 'KKRNP')
    end
    #set id
    record.id = 0345003
    # file = Record::FileDetails.new
    # file.file_id = "f46166fa14ce16c6e2622b3ce82830759c6334275dc8a317539bbda39a6ca056"
    # files = [file]

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """

    if module_api_name == 'Contacts'
      file_details = []

      file_detail =  Record::FileDetails.new

      file_detail.file_id = '479f0f5eebf0fb982f99e3832b35d23e29f67c2868ee4c789f22579895383c8'

      file_details.push(file_detail)

      record.add_key_value('File_Upload_1', file_details)
    end

    # """
    # Following methods are being used only by Inventory modules
    # """
    if %w[Quotes Sales_Orders Purchase_Orders Invoices].include? module_api_name
      line_item_product = Record::LineItemProduct.new
      line_item_product.id = 3_477_061_000_005_356_009
      inventory_line_item = Record::InventoryLineItems.new
      inventory_line_item.product = line_item_product
      inventory_line_item.list_price = 10.0
      inventory_line_item.discount = '5.0'
      inventory_line_item.quantity = 123.2
      line_tax = Record::LineTax.new
      line_tax.name = 'Tax1'
      line_tax.percentage = 20.0
      line_taxes = [line_tax]
      inventory_line_item.line_tax = line_taxes
      inventory_line_items = [inventory_line_item]
      record.add_key_value('Product_Details', inventory_line_items)
      record.add_key_value('Subject', 'asd')
    end
    # """
    # Following methods are being used only by Activity modules
    # """
    if %w[Tasks Events Calls].include? module_api_name
      remind_at = Record::RemindAt.new
      remind_at.alarm = 'FREQ=NONE;ACTION=EMAILANDPOPUP;TRIGGER=DATE-TIME:2020-07-03T12:30:00+05:30'
      who_id =  Record::Record.new
      who_id.id = 3_524_033_000_003_429_023
      record.add_field_value(Record::Field::Tasks.Who_id, who_id)

      participant_record = Record::Participants.new
      participant_record.participant = 'asdasd@gmail.com'
      participant_record.type = 'email'
      record.add_field_value(Record::Field::Events.Event_title, 'New Automated Event')
      endtime = DateTime.new(2019, 8, 10, 4, 11, 9, '+03:00')
      record.add_field_value(Record::Field::Events.End_datetime, endtime)
      starttime = DateTime.new(2019, 8, 10, 4, 10, 9, '+03:00')
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      participants = [participant_record]
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      recurring_activity = Record::RecurringActivity.new

      recurring_activity.rrule = 'FREQ=DAILY;INTERVAL=10;UNTIL=2020-08-14;DTSTART=2020-07-03'
      record.add_field_value(Record::Field::Events.Recurring_activity, recurring_activity)
    end

    if module_api_name == 'Price_Books'
      pricing_detail_record = Record::PricingDetails.new
      pricing_detail_record.from_range = 1.0
      pricing_detail_record.to_range = 1.0
      pricing_detail_record.discount = 1.0
      pricing_detail_records = [pricing_detail_record]
      record.add_key_value('Price_Book_Name', 'assd')
      record.add_field_value(Record::Field::Price_Books.Pricing_details, pricing_detail_records)
      record.add_field_value(Record::Field::Price_Books.Pricing_model, Util::Choice.new('Flat'))
    end
    # # Get instance of BodyWrapper Class that will contain the request body
    records.push(record)
    trigger = []
    trigger.push('approval')

    trigger.push('workflow')

    trigger.push('blueprint')
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = Record::BodyWrapper.new
    # Set the list to data in BodyWrapper instance
    body_wrapper.data = records
    # Set the lar_id in BodyWrapper instance
    body_wrapper.lar_id = '213123131'
    #set trigger
    body_wrapper.trigger = trigger
    process = ['review_process']
    # body_wrapper.process = process
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call update_records method that takes BodyWrapper instance and module_api_name as parameter.
    response = rr.update_records(module_api_name,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? Record::SuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.delete_records(module_api_name, record_ids)
    # """
    # This method is used to delete multiple records of a module and print the response.
    # :param module_api_name: The API Name of the module to delete records.
    # :param record_ids: The list of record IDs to be deleted
    # """

    # """
    # example
    # module_api_name = "Contacts";
    # record_ids = ["340964300756050", "340964300729017", "340964300729009"]
    # """
    records = []
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Possible parameters for Delete Records operation
    record_ids.each do |record_id|
      pm.add(Record::RecordOperations::DeleteRecordsParam.ids, record_id)
    end
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new

    # Call deleteRecords method that takes param_instance and module_api_name as parameter.
    response = rr.delete_records(module_api_name,pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? Record::SuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.upsert_records(module_api_name)
    # """
    # This method is used to Upsert records of a module and print the response.
    # :param module_api_name: The API Name of the module to upsert records.
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # """
    # List to hold Record instances
    records = []
    # Get instance of Record Class
    record = Record::Record.new
    # """
    # Call add_field_value method that takes two arguments
    # 1 -> Call Field "::" and choose the module from the displayed list and press "." and choose the field name from the displayed list.
    # 2 -> Value
    # """
    if module_api_name.downcase == 'Leads'.downcase
      record.add_field_value(Record::Field::Leads.Last_name, 'asdad')
      record.add_field_value(Record::Field::Leads.City, 'City')
      record.add_field_value(Record::Field::Leads.First_name, 'First Name')
      record.add_field_value(Record::Field::Leads.Company, 'KKRNP')
    end

    # file = Record::FileDetails.new
    # file.file_id = "f46166fa14ce16c6e2622b3ce82830759c6334275dc8a317539bbda39a6ca056"
    # files = [file]

    # """
    # Call add_key_value method that takes two arguments
    # 1 -> A string that is the Field's API Name
    # 2 -> Value
    # """

    if module_api_name == 'Contacts'
      file_details = []

      file_detail =  Record::FileDetails.new

      file_detail.file_id = '479f0f5eebf0fb982f99e3832b35d23e29f67c2868ee4c789f22579895383c8'

      file_details.push(file_detail)

      record.add_key_value('File_Upload_1', file_details)
    end

    # """
    # Following methods are being used only by Inventory modules
    # """
    if %w[Quotes Sales_Orders Purchase_Orders Invoices].include? module_api_name
      line_item_product = Record::LineItemProduct.new
      line_item_product.id = 3_477_061_000_005_356_009
      inventory_line_item = Record::InventoryLineItems.new
      inventory_line_item.product = line_item_product
      inventory_line_item.list_price = 10.0
      inventory_line_item.discount = '5.0'
      inventory_line_item.quantity = 123.2
      line_tax = Record::LineTax.new
      line_tax.name = 'Tax1'
      line_tax.percentage = 20.0
      line_taxes = [line_tax]
      inventory_line_item.line_tax = line_taxes
      inventory_line_items = [inventory_line_item]
      record.add_key_value('Product_Details', inventory_line_items)
      record.add_key_value('Subject', 'asd')
    end
    # """
    # Following methods are being used only by Activity modules
    # """
    if %w[Tasks Events Calls].include? module_api_name
      remind_at = Record::RemindAt.new
      remind_at.alarm = 'FREQ=NONE;ACTION=EMAILANDPOPUP;TRIGGER=DATE-TIME:2020-07-03T12:30:00+05:30'
      who_id =  Record::Record.new
      who_id.id = 3_524_033_000_003_429_023
      record.add_field_value(Record::Field::Tasks.Who_id, who_id)

      participant_record = Record::Participants.new
      participant_record.participant = 'asdasd@gmail.com'
      participant_record.type = 'email'
      record.add_field_value(Record::Field::Events.Remind_at, nil)

      record.add_field_value(Record::Field::Events.Event_title, 'New Automated Event')
      endtime = DateTime.new(2019, 8, 10, 4, 11, 9, '+03:00')
      record.add_field_value(Record::Field::Events.End_datetime, endtime)
      starttime = DateTime.new(2019, 8, 10, 4, 10, 9, '+03:00')
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      participants = [participant_record]
      record.add_field_value(Record::Field::Events.Start_datetime, starttime)

      recurring_activity = Record::RecurringActivity.new

      recurring_activity.rrule = 'FREQ=DAILY;INTERVAL=10;UNTIL=2020-08-14;DTSTART=2020-07-03'
      record.add_field_value(Record::Field::Events.Recurring_activity, recurring_activity)
    end

    if module_api_name == 'Price_Books'
      pricing_detail_record = Record::PricingDetails.new
      pricing_detail_record.from_range = 1.0
      pricing_detail_record.to_range = 1.0
      pricing_detail_record.discount = 1.0
      pricing_detail_records = [pricing_detail_record]
      record.add_key_value('Price_Book_Name', 'assd')
      record.add_field_value(Record::Field::Price_Books.Pricing_details, pricing_detail_records)
      record.add_field_value(Record::Field::Price_Books.Pricing_model, Util::Choice.new('Flat'))
    end
    # # Get instance of BodyWrapper Class that will contain the request body
    records.push(record)
    trigger = []
    trigger.push('approval')

    trigger.push('workflow')

    trigger.push('blueprint')
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = Record::BodyWrapper.new
    # Set the list to data in BodyWrapper instance
    body_wrapper.data = records
    # Set the lar_id in BodyWrapper instance
    body_wrapper.lar_id = '213123131'
    #set trigger
    body_wrapper.trigger = trigger
    process = ['review_process']
    # body_wrapper.process = process
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call upsertRecords method that takes BodyWrapper instance and module_api_name as parameters.
    response = rr.upsert_records(module_api_name,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? Record::SuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.get_deleted_records(module_api_name)
    # """
    # This method is used to get the deleted records of a module and print the response.
    # :param module_api_name: The API Name of the module to get the deleted records.
    # """

    # """
    # example
    # module_api_name = "Deals"
    # """
    # Get instance of RecordOperations Class
    ro = Record::RecordOperations.new
    # Get instance of HeaderMap Class
    hm = HeaderMap.new
    # record_id = 305495066
    # Possible headers for Get Deleted Records operation
    hm.add(Record::RecordOperations::GetDeletedRecordsHeader.If_modified_since, DateTime.new(2019, 8, 10, 4, 10, 9, '+03:00'))
    # field_names =["Company","Email"]
    # field_names.each do |field_name|
    # end
    # # Get instance of HeaderMap Class
    pm = ParameterMap.new
    # Call getDeletedRecords method that takes param_instance, header_instance and module_api_name as parameter
    response = ro.get_deleted_records(module_api_name,pm, hm)
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
        # Check if expected DeletedRecordsWrapper instance is received.
        if response_handler.is_a? Record::DeletedRecordsWrapper
          # Get the list of obtained DeletedRecord instances
          deleted_records = response_handler.data
          deleted_records.each do |deleted_record|
            # Get the ID of each DeletedRecord
            print "\n DeletedRecord ID: "
            print deleted_record.id.to_s
            # Get the deletedBy User instance of each DeletedRecord
            deleted_by = deleted_record.deleted_by
            # Check if deleted_by is not None
            unless deleted_by.nil?
              # Get the Name of the deleted_by User
              print "\n DeletedRecord Deleted By User-Name: "
              print deleted_by.name
              # Get the ID of the deleted_by User
              print "\n DeletedRecord Deleted By User-Id: "
              print deleted_by.id.to_s
            end
            # Get the createdBy User instance of each DeletedRecord
            created_by = deleted_record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n DeletedRecord Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n DeletedRecord Created By User-Id: "
              print created_by.id.to_s
            end
            # Get the DisplayName of each DeletedRecord
            print "\n DeletedRecord DisplayName: "
            print deleted_record.display_name
            # Get the Type of each DeletedRecord
            print "\n DeletedRecord Type: "
            print deleted_record.type
            # Get the DeletedTime of each DeletedRecord
            print "\n DeletedRecord DeletedTime: "
            print deleted_record.deleted_time
          end
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n Record Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Record Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n Record Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n Record Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Record::APIException
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
          # Get the details dict
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

  def self.search_records(module_api_name)
    # """
    # This method is used to search records of a module and print the response.
    # :param module_api_name: The API Name of the module to search records.
    # """

    # """
    # example
    # module_api_name = "Price_Books"
    # """
    # Get instance of RecordOperations Class
    ro = Record::RecordOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # record_id = 305495066
    # Possible parameters for Search Records operation
    # Encoding must be done for parentheses or comma
    pm.add(Record::RecordOperations::SearchRecordsParam.criteria, 'Last_Name:starts_with:a')

    # pm.add(Record::RecordOperations::GetRecordParam.converted,"false")
    # field_names =["Company","Email"]
    # field_names.each do |field_name|
    #     pm.add(Record::::RecordOperations::GetRecordParam.fields,field_name)
    # end
    # Call searchRecords method that takes ParameterMap Instance and moduleAPIName as parameter
    response = ro.search_records(module_api_name,pm)
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
        if response_handler.is_a? Record::ResponseWrapper

          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\n Record ID: "
            print record.id.to_s
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Record Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Record Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Record Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\n Record CreatedTime: "
            print record.created_time
            # Get the modified_by User instance of each Record
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Record Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Record Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modified_by User
              print "\n Record Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\n Record ModifiedTime: "
            print record.modified_time
            tags = record.tag
            if !tags.nil? && tags.size.positive?
              tags.each do |tag|
                # Get the Name of each Tag
                print "\n Record Tag Name: "
                print tag.name
                # Get the Id of each Tag
                print "\n Record Tag ID: "
                print tag.id.to_s
              end
            end
            # To get particular field value
            print "\n Record Field Value: "
            print record.get_key_value('Last_Name')
            # To get particular KeyValues
            print "\n Record KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                if data_list.length.positive?
                  #check if the data is  Record::FileDetails
                  if data_list[0].is_a? Record::FileDetails
                    file_details = data_list
                    file_details.each do |file_detail|
                      # Get the Extn of each FileDetails
                      print "\n Record FileDetails Extn: "
                      print file_detail.extn
                      # Get the IsPreviewAvailable of each FileDetails
                      print "\n Record FileDetails IsPreviewAvailable: "
                      print file_detail.is_preview_available
                      # Get the DownloadUrl of each FileDetails
                      print "\n Record FileDetails DownloadUrl: "
                      print file_detail.download_url
                      # Get the DeleteUrl of each FileDetails
                      print "\n Record FileDetails DeleteUrl: "
                      print file_detail.delete_url
                      # Get the Mode of each FileDetails
                      print "\n Record FileDetails Mode: "
                      print file_detail.mode
                      # Get the EntityId of each FileDetails
                      print "\n Record FileDetails EntityId: "
                      print file_detail.entity_id
                      # Get the OriginalSizeByte of each FileDetails
                      print "\n Record FileDetails OriginalSizeByte: "
                      print file_detail.original_size_byte
                      # Get the PreviewUrl of each FileDetails
                      print "\n Record FileDetails PreviewUrl: "
                      print file_detail.preview_url
                      # Get the FileName of each FileDetails
                      print "\n Record FileDetails FileName: "
                      print file_detail.file_name
                      # Get the FileId of each FileDetails
                      print "\n Record FileDetails FileId: "
                      print file_detail.file_id
                      # Get the AttachmentId of each FileDetails
                      print "\n Record FileDetails AttachmentId: "
                      print file_detail.attachment_id
                      # Get the FileSize of each FileDetails
                      print "\n Record FileDetails FileSize: "
                      print file_detail.file_size
                      # Get the CreatorId of each FileDetails
                      print "\n Record FileDetails CreatorId: "
                      print file_detail.creator_id
                      # Get the LinkDocs of each FileDetails
                      print "\n Record FileDetails LinkDocs: "
                      print file_detail.link_docs
                    end
                  elsif data_list[0].is_a? Record::Reminder
                    reminders = data_list
                    reminders.each do |reminder|
                      # Get the Reminder Period
                      print "\n Reminder Period: "
                      print reminder.period
                      # Get the Reminder Unit
                      print "\n Reminder Unit: "
                      print reminder.unit
                    end
                  elsif data_list[0].is_a? Record::ImageUpload
                    image_uploads = data_list
                    image_uploads.each do |image_upload|
                      # Get the Record  Description: 
                      print "\n Record  Description: : "
                      print image_upload.description
                      # Get the Related Record PreviewId
                      print "\nRecord  PreviewId: "
                      print image_upload.preview_id
                      # Get the Related Record File_Name
                      print "\n Record  File_Name: "
                      print image_upload.file_name
                      # Get the Related Record State
                      print "\n Record  State:  "
                      print image_upload.state
                      # Get the Record  Size: 
                      print "\n Record  Size: : "
                      print image_upload.size
                      # Get the Related Record SequenceNumber
                      print "\nRecord  SequenceNumber: "
                      print image_upload.sequence_number
                      # Get the Related Record Id
                      print "\n Record  Id: "
                      print image_upload.id
                      # Get the Related Record FileId
                      print "\n Record  FileId:  "
                      print image_upload.file_id
                    end
                    #check if the datatype is Tags::Tag
                  elsif data_list[0].is_a? Tags::Tag
                    tags = data_list
                    tags.each do |tag|
                      # Get the Record Tag Name
                      print "\n Record Tag Name: "
                      print tag.name
                      # Get the Record Tag ID
                      print "\n Record Tag ID: "
                      print tag.id.to_s
                    end
                  elsif data_list[0].is_a? Record::Tax
                    tax = data_list[0]
                      # Get the Record Tax Name
                      print "\n Record Tax Name: "
                      print tax.name
                      # Get the Record Tax ID
                      print "\n Record Tax ID: "
                      print tax.id.to_s
                    #check if the datatype is Record::Comment
                  elsif data_list[0].is_a? Record::Comment
                    comments = data_list
                    unless comments.nil?
                      comments.each do |comment|
                        # Get the Record CommentedBy
                        print "\n Record Comment CommentedBy: "
                        print comment.commented_by
                        # Get the Record CommentedTime
                        print "\n Record Comment CommentedTime: "
                        print comment.commented_time
                        # Get the Record CommentContent
                        print "\n Record Comment CommentContent: "
                        print comment.comment_content
                        # Get the Record Id
                        print "\n Record Comment Id: "
                        print comment.id.to_s
                      end
                    end
                    #check if the datatype is Attachments::Attachment
                  elsif data_list[0].is_a? Attachments::Attachment
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
                      # Get the parentId Record instance of each attachment
                      parent_id = attachment.parent_id
                      unless parent_id.nil?
                        # Get the parent record Name of each attachment
                        print "\n Attachment parent record Name: "
                        print parent_id.get_key_value('name')
                        # Get the parent record ID of each attachment
                        print "\n Attachment parent record ID: "
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
                  elsif data_list[0].is_a? Record::PricingDetails
                    pricing_details = data_list
                    pricing_details.each do |pricing_detail|
                      # Get the pricing details to range
                      print "\n Record PricingDetails ToRange: "
                      print pricing_detail.to_range
                      # Get the pricing details Discount
                      print "\n Record PricingDetails Discount: "
                      print pricing_detail.discount
                      # Get the pricing details id
                      print "\n Record PricingDetails ID: "
                      print pricing_detail.id.to_s
                      # Get the pricing details FromRange
                      print "\n Record PricingDetails FromRange: "
                      print pricing_detail.from_range
                    end
                    #check if the datatype is Record::Participants
                  elsif data_list[0].is_a? Record::Participants
                    participants = data_list
                    participants.each do |participant|
                      # Get the participant Name
                      print "\n Record Participants Name:  "
                      print participant.name
                      # Get the participant Invited
                      print "\n Record Participants Invited:  "
                      print participant.invited
                      # Get the participant ID
                      print "\n Record Participants ID:  "
                      print participant.id
                      # Get the participant Type
                      print "\n Record Participants Type :  "
                      print participant.type
                      # Get the participant Participant
                      print "\n Record Participants Participant:  "
                      print participant.participant
                      # Get the participant Status
                      print "\n Record Participants Status:  "
                      print participant.status
                    end
                    #check if the datatype is Record::Record
                  elsif data_list[0].is_a? Record::Record
                    records_ = data_list
                    records_.each do |record_|
                      record_.get_key_values.each do |k, v|
                        print "\n"
                        print k
                        print v
                      end
                    end
                    #check if the datatype is Record::LineTax
                  elsif data_list[0].is_a? Record::LineTax
                    line_taxes = data_list
                    line_taxes.each do |line_tax|
                      # Get the ProductDetails linetax percentage
                      print "\n Record ProductDetails LineTax Percentage: "
                      print line_tax.percentage
                      # Get the ProductDetails linetax Name
                      print "\n Record ProductDetails LineTax Name: "
                      print line_tax.name
                      # Get the ProductDetails linetax ID
                      print "\n Record ProductDetails LineTax ID: "
                      print line_tax.id.to_s
                      # Get the ProductDetails linetax Value
                      print "\n Record ProductDetails LineTax Value: "
                      print line_tax.value
                    end
                    #check if the datatype is Util::Choice
                  elsif data_list[0].is_a? Util::Choice
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
              elsif value.is_a? Layouts::Layout
                layout = value
                #check of the Layout is not null
                unless layout.nil?
                  # get the record id
                  print "\n Record " + key_name + ' ID:' + layout.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' Name:' + layout.name
                end
              #check of the value is User
              elsif value.is_a? Users::User
                user = value
                #check of the User is not null
                unless user.nil?
                  # get the record id
                  print "\n Record " + key_name + ' User-ID:' + user.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' User-Name:' + user.name
                  # get the record email
                  print "\n Record " + key_name + ' User-Email:' + user.email
                end
              #check of the value is Record::Record
              elsif value.is_a? Record::Record
                record_value = value
                #check of the record is not null
                unless record_value.nil?
                  # get the record id
                  print "\n Record " + key_name + ' ID:' + record_value.id.to_s
                  # get the record name
                  print "\n Record " + key_name + ' Name:' + record_value.get_key_value('name')
                end
              #check of the value is Record::Consent
              elsif value.is_a? Record::Consent
                consent = value
                print "\n Record Consent ID: "
                print consent.id
                # Get the Owner User instance of the Consent
                owner = consent.owner
                unless owner.nil?
                  # Get the ID of the Owner User
                  print "\n Record Consent Owner User-ID:"
                  print owner.id.to_s
                  # Get the Name of the Owner User
                  print "\n Record Consent Owner User-Name:"
                  print owner.name
                  # Get the Email of the Owner User
                  print "\n Record Consent Owner User-Email:"
                  print owner.email
                  print "\n"
                end
                # Get the createdBy User instance of each Record
                consent_created_by = consent.created_by
                # Check if created_by is not None
                unless consent_created_by.nil?
                  # Get the Name of the created_by User
                  print "\n Record Consent Created User-Name:"
                  print consent_created_by.name
                  # Get the ID of the created_by User
                  print "\n Record Consent Created User-ID:"
                  print consent_created_by.id.to_s
                  # Get the Email of the created_by User
                  print "\n Record Consent Created User-Email:"
                  print consent_created_by.email
                  print "\n"
                end
                # Check if Modified is not None
                consent_modified_by = consent.modified_by
                unless consent_modified_by.nil?
                  # Get the Name of the ModifiedBy User
                  print "\n Record Consent  Modified User-Name:"
                  print consent_modified_by.name
                  # Get the ID of the ModifiedBy User
                  print "\n Record Consent  Modified User-ID:"
                  print consent_modified_by.id.to_s
                  # Get the Email of the ModifiedBy User
                  print "\n Record Consent  Modified User-Email:"
                  print consent_modified_by.email
                  print "\n"
                end
                # Get the CreatedTime of each Record
                print "\n Record  Consent CreatedTime: "
                print consent.created_time
                # Get the ModifiedTime of each Consent
                print "\n Record  Consent ModifiedTime: "
                print consent.modified_time
                # Get the ContactThroughEmail of each Consent
                print "\n Record  Consent ContactThroughEmail: "
                print consent.contact_through_email
                # Get the ContactThroughSocial of each Consent
                print "\n Record  Consent ContactThroughSocial: "
                print consent.contact_through_social
                # Get the ContactThroughSurvey of each Consent
                print "\n Record  Consent ContactThroughSurvey: "
                print consent.contact_through_survey
                # Get the ContactThroughPhone of each Consent
                print "\n Record  Consent ContactThroughPhone: "
                print consent.contact_through_phone
                # Get the MailSentTime of each Consent
                print "\n Record  Consent MailSentTime: "
                print consent.mail_sent_time
                # Get the ConsentDate of each Consent
                print "\n Record  Consent ConsentDate: "
                print consent.consent_date
                # Get the ConsentRemarks of each Consent
                print "\n Record  Consent ConsentRemarks: "
                print consent.consent_remarks
                # Get the ConsentThrough of each Consent
                print "\n Record  Consent ConsentThrough: "
                print consent.consent_through
                # Get the DataProcessingBasis of each Consent
                print "\n Record  Consent DataProcessingBasis: "
                print consent.data_processing_basis
                # Get the Lawful Reason of each Consent
                print "\n Record Consent Lawful Reason: "
                print consent.get_key_value('Lawful_Reason')
              #check of the value is Record::RemindAt
              elsif value.is_a? Record::RemindAt
                # Get the alarm of value
                print "\n Record " + key_name + ' :' + value.alarm
              #check of the value is Record::RecurringActivity
              elsif value.is_a? Record::RecurringActivity
                # Get the rrule of value
                print "\n RRule " + key_name + ' :' + value.rrule
              #check of the value is Util::Choice
              elsif value.is_a? Util::Choice
                choice_value = value
                print "\n Record " + key_name + ':' + choice_value.value
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
              print "\n Record Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Record Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n Record Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n Record Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Record::APIException
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

  def self.convert_lead(lead_id)
    # """
    # This method is used to Convert a Lead record and print the response.
    # :param lead_id: The ID of the Lead to be converted.
    # """

    # """
    # lead_id = 340964302034003
    # """
    records = []
    module_api_name = 'Leads'
    (0..0).each do |i|
      # Get instance of LeadConverter Class
      record = Record::LeadConverter.new
      #set overwrite
      record.overwrite = true
      #set notify lead owner
      record.notify_lead_owner = true
      #set notify entity lead owner
      record.notify_new_entity_owner = true
      #set accounts
      # record.accounts = '305113002'
      # #set contacts
      # record.contacts = '303429023'
      # #set assign to
      # record.assign_to = '303523022'
      Date.new(2001, 2, 3)
      #get instance of deals record
      deals = Record::Record.new
      # """
      # Call add_field_value method that takes two arguments
      # 1 -> Call Field "::" and choose the module from the displayed list and press "." and choose the field name from the displayed list.
      # 2 -> Value
      # """
      deals.add_field_value(Record::Field::Deals.Closing_date,  Date.new(2001, 2, 3))
      deals.add_field_value(Record::Field::Deals.Deal_name, 'deal_name')
      deals.add_field_value(Record::Field::Deals.Description, 'deal_name')
      deals.add_field_value(Record::Field::Deals.Stage, Util::Choice.new('Closed Won'))
      deals.add_field_value(Record::Field::Deals.Amount, 50.7)
      deals.add_key_value("Pipeline", Util::Choice.new("Qualification"))
      # """
      # Call add_key_value method that takes two arguments
      # 1 -> A string that is the Field's API Name
      # 2 -> Value
      # """

      deals.add_key_value('Custom_field', 'Value')
      deals.add_key_value('Custom_field_2', 'value')
      # deals.add_key_value("Closing_Date","2020-08-11T14:21:15+05:30")
      record.deals = deals
      records.push(record)
    end
    # Get instance of ConvertBodyWrapper Class that will contain the request body
    convert_body_wrapper = Record::ConvertBodyWrapper.new
    #set records to data
    convert_body_wrapper.data = records
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call convertLead method that takes ConvertBodyWrapper instance and lead_id as parameter
    response = rr.convert_lead(lead_id,convert_body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::ConvertActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if the request is successful
            if action_response.is_a? Record::SuccessfulConvert
              successful_convert = action_response
              # Get the Accounts ID of  Record
              print '\n LeadConvert Accounts ID:'
              print successful_convert.accounts
              # Get the Contacts ID of  Record
              print "\n LeadConvert Contacts ID::"
              print successful_convert.contacts
              # Get the Deals ID of  Record
              print "\n LeadConvert Deals ID::"
              print successful_convert.deals
            # Check if the request returned an exception
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.get_photo(module_api_name, record_id, destination_folder)
    # """
    # This method is used to download a photo associated with a record.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record
    # :param destination_folder: The absolute path of the destination folder to store the photo.
    # """

    # """
    # example
    # module_api_name = "Contacts"
    # record_id = 340964302034003
    # destination_folder = "/Users/user-name/Documents"
    # """

    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call getPhoto method that takes module_api_name and record_id as parameters
    response = rr.get_photo(record_id,module_api_name )
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      #Check if expected  instance is received
      # Check if expected instance is received.
      if response.is_expected
        downloader_handler = response.data_object
        # Check if expected ResponseWrapper instance is received.
        if downloader_handler.is_a? Record::FileBodyWrapper
          file_body_wrapper = downloader_handler
          # Get StreamWrapper instance from the returned FileBodyWrapper instance
          stream_wrapper = file_body_wrapper.file
          # Construct the file name by joining the destinationFolder and the name from StreamWrapper instance
          # Open the destination file where the file needs to be written in 'w' mode
          File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
        # Check if the request returned an exception
        elsif downloader_handler.is_a? Record::APIException
          exception = downloader_handler
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

  def self.upload_photo(module_api_name, record_id, absolute_file_path)
    # """
    # This method is used to attach a photo to a record. You must include the file in the request
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record
    # :param absolute_file_path: The absolute file path of the file to be uploaded
    # """

    # """
    # example
    # module_api_name = "Contacts"
    # record_id = 340964302034003
    # absolute_file_path = "/Users/user_name/Desktop/image.png"
    # """

    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Get instance of FileBodyWrapper class that will contain the request file
    fbw = Record::FileBodyWrapper.new
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
    # Call uploadPhoto method that takes FileBodyWrapper instance, module_api_name and record_id as parameter
    response = rr.upload_photo(record_id, module_api_name,fbw )
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get the list of obtained ActionResponse instances
        file_handler = response.data_object
        # Check if the request is successful
        if file_handler.is_a? Record::SuccessResponse
          success_response = file_handler
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
        elsif file_handler.is_a? Record::APIException
          api_exception = file_handler
          # Get the Code
          print 'code:'
          print api_exception.code.value
          # Get the Status
          print "\n status:"
          print api_exception.status.value
          # Get the Message
          print "\n message:"
          print api_exception.message.value
          # Get the details dict
          api_exception.details.each do |k, v|
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

  def self.delete_photo(module_api_name, record_id)
    # """
    # This method is used to delete a photo from a record in a module.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to delete photo
    # """

    # """
    # example
    # module_api_name = "Contacts"
    # record_id = 340964302034003
    # """

    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call deletePhoto method that takes module_api_name and record_id as parameter
    response = rr.delete_photo(record_id,module_api_name)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if status_code == 204
        print('No Content')
        return
      end
      #Check if expected  instance is received
      if response.is_expected
        file_handler = response.data_object
        # Check if expected SuccessResponse instance is received.
        if file_handler.is_a? Record::SuccessResponse
          success_response = file_handler
          # Get the Code
          print 'code:'
          print success_response.code.value
          # Get the status
          print "\n status:"
          print success_response.status.value
          # Get the message
          print "\n message:"
          print success_response.message.value
          #  Get the details dict
          success_response.details.each do |k, v|
            print "\n"
            print k
            print v
            print "\n"
          end

          print "\n"
        # Check if the request returned an exception
        elsif file_handler.is_a? Record::APIException
          exception = file_handler
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

  def self.mass_update_records(module_api_name)
    # """
    # This method is used to update the values of specific fields for multiple records and print the response.
    # :param module_api_name: The API Name of the module to mass update records.
    # """

    # """
    # example
    # module_api_name = "Contacts"
    # """
    cvid = '347706100087501'
    # List to hold Record instances
    records = []
    record_ids = [347706106601007]
    (0..0).each do |i|
      record = Record::Record.new
      record.add_field_value(Record::Field::Leads.Company, 'asdad')
      records.push(record)
    end
    mass_update_body_wrapper = Record::MassUpdateBodyWrapper.new
    # Set the array to data in MassUpdateBodyWrapper instance
    mass_update_body_wrapper.data = records
    # Set the array of IDs to MassUpdateBodyWrapper instance
    # mass_update_body_wrapper.ids = record_ids
    # Set the cvid to MassUpdateBodyWrapper instance
    mass_update_body_wrapper.cvid = cvid
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call massUpdateRecords method that takes MassUpdateBodyWrapper instance, module_api_name as parameter.
    response = rr.mass_update_records(module_api_name,mass_update_body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Record::MassUpdateActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained MassUpdate ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if the request is successful
            if action_response.is_a? Record::MassUpdateSuccessResponse
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
            elsif action_response.is_a? Record::APIException
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
        elsif action_handler.is_a? Record::APIException
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

  def self.get_mass_update_status(module_api_name, job_id)
    # """
    # This method is used to get the status of the mass update job scheduled previously and print the response.
    # :param module_api_name: The API Name of the module to obtain status of Mass Update.
    # :param job_id: The ID of the job obtained from the response of Mass Update Records.
    # """

    # """
    # example
    # module_api_name = "Leads"
    # job_id = "347706105177002"
    # """
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    # Possible parameters for Get MassUpdate Status operation
    pm.add(Record::RecordOperations::GetMassUpdateStatusParam.job_id, job_id)
    # Get instance of RecordOperations Class
    rr = Record::RecordOperations.new
    # Call getMassUpdateStatus method that takes ParameterMap instance and module_api_name as parameter
    response = rr.get_mass_update_status(module_api_name,pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      #Check if expected  instance is received
      if response.is_expected
        # Get object from response
        mass_update_response_handler = response.data_object
        # Check if expected MassUpdateResponseWrapper instance is received.
        if mass_update_response_handler.is_a? Record::MassUpdateResponseWrapper
          mass_update_response_wrapper = mass_update_response_handler
          # Get the list of MassUpdate ActionResponse data
          mass_update_responses = mass_update_response_wrapper.data
          mass_update_responses.each do |mass_update_response|
            # Check if the request is successful
            if mass_update_response.is_a? Record::MassUpdate
              mass_update = mass_update_response
              # Get the Status of each MassUpdate
              print "\n MassUpdate Status: "
              print mass_update.status.value
              # Get the FailedCount of each MassUpdate
              print "\nMassUpdate FailedCount: "
              print mass_update.failed_count
              # Get the UpdatedCount of each MassUpdate
              print "\nMassUpdate UpdatedCount: "
              print mass_update.updated_count
              # Get the NotUpdatedCount of each MassUpdate
              print "\nMassUpdate NotUpdatedCount: "
              print mass_update.not_updated_count
              # Get the TotalCount of each MassUpdate
              print "\nMassUpdate TotalCount: "
              print mass_update.total_count
            # Check if the request returned an exception
            elsif mass_update_response.is_a? Record::APIException
              api_exception = mass_update_response
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
        elsif mass_update_response_handler.is_a? Record::APIException
          exception = mass_update_response_handler
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
