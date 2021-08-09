require 'ZCRMSDK'

class Send_Mail
  def self.get_email_addresses()
    # """
    # This method is used to get the email addresses
    # """


    # Get instance of SendMailOperations Class 

    aro = SendMail::SendMailOperations.new()

    # Call get_email_addresses method
    response = aro.get_email_addresses()
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
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? SendMail::ResponseWrapper
          # Get the list of obtained SendMail instances
            from_addresses = response_handler.from_addresses
            from_addresses.each do |from_address|
                # Get the email of From addresses
                print "\n From address email: "
                print from_address.email
                # Get the Type of From addresses
                print "\n From address Type: "
                print from_address.type
                # Get the UserName of From addresses
                print "\n From address UserName: "
                print from_address.user_name
                # Get the ID of each From addresses
                print "\n From address ID: "
                print from_address.id.to_s
                 # Get the Default of each From addresses
                 print "\n From address Default: "
                 print from_address.default

            end
        # Check if the request returned an exception
        elsif response_handler.is_a? SendMail::APIException
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
  def self.send_mail
    # """
    # This method is used to Send Mail and print the response.
    # """
    # List to hold SendMail instances
    mails = []
    record_id  = 0304001
    module_api_name= "Leads"
    # Get instance of Mail Class
    mail = SendMail::Mail.new
    user_address_from = SendMail::UserAddress.new
    user_address_to = SendMail::UserAddress.new
    user_address_cc = SendMail::UserAddress.new
    template = EmailTemplates::EmailTemplate.new
    template.id = 347706179
    user_address_from.user_name = "patricia Boyle"
    user_address_from.email = "patricia.k@zoho.com"
    user_address_to.user_name = "patricia Boyle"
    user_address_to.email = "Boyle@zoho.com"
    user_address_cc.user_name = "patricia Boyle"
    user_address_cc.email = "Boyle@zoho.com"
    mail.from = user_address_from
    user_address_tos =[user_address_to]
    mail.cc = [user_address_cc]
    mail.to = user_address_tos
    mail.subject = "Testing Send Mail API"
    mail.content = "<br><a href=\"{ConsentForm.en_US}\" id=\"ConsentForm\" class=\"en_US\" target=\"_blank\">Consent form link</a><br><br><br><br><br><h3><span style=\"background-color: rgb(254, 255, 102)\">REGARDS,</span></h3><div><span style=\"background-color: rgb(254, 255, 102)\">AZ</span></div><div><span style=\"background-color: rgb(254, 255, 102)\">ADMIN</span></div> <div></div>"
    mail.mail_format = "html"
    mail.template = template;
    mail.consent_email = false
    mails.push(mail)
    # Set the list of SendMail in BodyWrapper instance
    body_wrapper = SendMail::BodyWrapper.new
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper.data = mails
    # Get instance of SendMailOperations Class
    smo = SendMail::SendMailOperations.new
    # Call create_send_mail method that takes BodyWrapper instance as parameter
    response = smo.send_mail(record_id,module_api_name,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? SendMail::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? SendMail::SuccessResponse
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
            elsif action_response.is_a? SendMail::APIException
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
        elsif action_handler.is_a? SendMail::APIException
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
