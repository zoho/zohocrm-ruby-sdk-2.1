require 'ZOHOCRMSDK2_1'

class Email_Templates
  def self.get_email_templates(module_api_name)
    # """
    # This method is used to get the email templates data.
    # """

    # Get instance of EmailTemplateOperations Class 
    # module_api_name = "Leads"
    aro = ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations.new()

    param_instance = ZOHOCRMSDK::ParameterMap.new

    param_instance.add(ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations::GetEmailTemplatesParam.module_1, module_api_name)

    # Call get_email_templates method
    response = aro.get_email_templates(param_instance)
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
        if response_handler.is_a? ZOHOCRMSDK::EmailTemplates::ResponseWrapper
          # Get the list of obtained EmailTemplate instances
            email_templates = response_handler.email_templates
            email_templates.each do |et|
                # Get the Modified Time of each EmailTemplate
                print "\nEmailTemplate Modified Time: "
                print et.modified_time
                # Get the Created Time value of each EmailTemplate
                print "\nEmailTemplate Created Time: "
                print et.created_time
                # Get the list of attachments each EmailTemplate
                attachments = et.attachments
                unless attachments.nil?
                  attachments.each do |attachment|
                      # Get the File ID of each Attachment
                      print "EmailTemplate Attachment File ID: "
                      print attachment.file_id
                      # Get  \the File Name of each Attachment
                      print "EmailTemplate Attachment File Name: "
                      print attachment.file_name
                      #Get the Size of Attachment
                      print "EmailTemplate Attachment Size: " 
                      print attachment.size
                      #Get the ID of Attachment
                      print "EmailTemplate Attachment ID: " 
                      print attachment.id
                  end
                end
                # Get the Module of each EmailTemplate
                module_1 = et.module
                if !module_1.nil?
                    print "\nEmailTemplate Module ID: "
                    print module_1.id
                    print "\nEmailTemplate Module API-Name: "
                    print module_1.name
                end
                # Get the modifiedBy of each EmailTemplate
                modified_by = et.modified_by
                if !modified_by.nil?
                    print "\nEmailTemplate modified_by User-ID: "
                    print modified_by.id
                    print "\nEmailTemplate modified_by User-Name: "
                    print modified_by.name
                    print "\nEmailTemplate modified_by User-Email: "
                    print modified_by.email
                end
                # Get the createdBy of each EmailTemplate
                created_by = et.created_by
                if !created_by.nil?
                    print "\nEmailTemplate created_by User-ID: "
                    print created_by.id
                    print "\nEmailTemplate created_by User-Name: "
                    print created_by.name
                    print "\nEmailTemplate created_by User-Email: "
                    print created_by.email
                end
                 # Get the folder of each EmailTemplate
                 folder = et.folder
                 if !folder.nil?
                     print "\nEmailTemplate folder ID: "
                     print folder.id
                     print "\nEmailTemplate folder Name: "
                     print folder.name
                 end
                # Get the Subject of each EmailTemplate
                print "\nEmailTemplate Subject: "
                print et.subject
                # Get the Type of each EmailTemplate
                print "\nEmailTemplate Type: "
                print et.type
                # Get the Last Usage Time of each EmailTemplate
                print "\nEmailTemplate  Last Usage Time: "
                print et.last_usage_time
                # Get the Consent Linked of each EmailTemplate
                print "\nEmailTemplate Consent Linked: "
                print et.consent_linked
                # Get the Name of each EmailTemplate
                print "\nEmailTemplate Name: "
                print et.name
                # Get the Associated of each EmailTemplate
                print "\nEmailTemplate Associated: "
                print et.associated
                # Get the Content of each EmailTemplate
                print "\nEmailTemplate Content: "
                print et.content
                # Get the ID of each EmailTemplate
                print "\nEmailTemplate ID: "
                print et.id.to_s
                # Get the description of each EmailTemplate
                print "\nEmailTemplate description: "
                print et.description
                # Get the EditorMode of each EmailTemplate
                print "\nEmailTemplate EditorMode: "
                print et.editor_mode
                # Get the Subject of each EmailTemplate
                print "\nEmailTemplate Subject: "
                print et.subject
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
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::EmailTemplates::APIException
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

  def self.get_email_template_by_id(email_template_id)
    # """
    # This method is used to get the email template data.
    # """


    # Get instance of EmailTemplateOperations Class
    aro = ZOHOCRMSDK::EmailTemplates::EmailTemplatesOperations.new()

    # Call get_email_templates method
    response = aro.get_email_template_by_id(email_template_id)
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
            if response_handler.is_a? ZOHOCRMSDK::EmailTemplates::ResponseWrapper
            # Get the list of obtained EmailTemplate instances
                email_templates = response_handler.email_templates
                email_templates.each do |et|
                    # Get the Modified Time of each EmailTemplate
                    print "\nEmailTemplate Modified Time: "
                    print et.modified_time
                    # Get the Created Time value of each EmailTemplate
                    print "\nEmailTemplate Created Time: "
                    print et.created_time
                    # Get the list of attachments each EmailTemplate
                    attachments = et.attachments
                    unless attachments.nil?
                      attachments.each do |attachment|
                          # Get the File ID of each Attachment
                          print "EmailTemplate Attachment File ID: "
                          print attachment.file_id
                          # Get  \the File Name of each Attachment
                          print "EmailTemplate Attachment File Name: "
                          print attachment.file_name
                          #Get the Size of Attachment
                          print "EmailTemplate Attachment Size: " 
                          print attachment.size
                          #Get the ID of Attachment
                          print "EmailTemplate Attachment ID: " 
                          print attachment.id
                      end
                    end
                    # Get the Module of each EmailTemplate
                    module_1 = et.module
                    if !module_1.nil?
                        print "\nEmailTemplate Module ID: "
                        print module_1.id
                        print "\nEmailTemplate Module API-Name: "
                        print module_1.name
                    end
                    # Get the modifiedBy of each EmailTemplate
                    modified_by = et.modified_by
                    if !modified_by.nil?
                        print "\nEmailTemplate modified_by User-ID: "
                        print modified_by.id
                        print "\nEmailTemplate modified_by User-Name: "
                        print modified_by.name
                        print "\nEmailTemplate modified_by User-Email: "
                        print modified_by.email
                    end
                    # Get the createdBy of each EmailTemplate
                    created_by = et.created_by
                    if !created_by.nil?
                        print "\nEmailTemplate created_by User-ID: "
                        print created_by.id
                        print "\nEmailTemplate created_by User-Name: "
                        print created_by.name
                        print "\nEmailTemplate created_by User-Email: "
                        print created_by.email
                    end
                    # Get the folder of each EmailTemplate
                    folder = et.folder
                    if !folder.nil?
                        print "\nEmailTemplate folder ID: "
                        print folder.id
                        print "\nEmailTemplate folder Name: "
                        print folder.name
                    end
                    # Get the Subject of each EmailTemplate
                    print "\nEmailTemplate Subject: "
                    print et.subject
                    # Get the Type of each EmailTemplate
                    print "\nEmailTemplate Type: "
                    print et.type
                    # Get the Last Usage Time of each EmailTemplate
                    print "\nEmailTemplate  Last Usage Time: "
                    print et.last_usage_time
                    # Get the Consent Linked of each EmailTemplate
                    print "\nEmailTemplate Consent Linked: "
                    print et.consent_linked
                    # Get the Name of each EmailTemplate
                    print "\nEmailTemplate Name: "
                    print et.name
                    # Get the Associated of each EmailTemplate
                    print "\nEmailTemplate Associated: "
                    print et.associated
                    # Get the Content of each EmailTemplate
                    print "\nEmailTemplate Content: "
                    print et.content
                    # Get the ID of each EmailTemplate
                    print "\nEmailTemplate ID: "
                    print et.id.to_s
                    # Get the description of each EmailTemplate
                    print "\nEmailTemplate description: "
                    print et.description
                    # Get the EditorMode of each EmailTemplate
                    print "\nEmailTemplate EditorMode: "
                    print et.editor_mode
                    # Get the Subject of each EmailTemplate
                    print "\nEmailTemplate Subject: "
                    print et.subject
                end
            # Check if the request returned an exception
            elsif response_handler.is_a? ZOHOCRMSDK::EmailTemplates::APIException
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
