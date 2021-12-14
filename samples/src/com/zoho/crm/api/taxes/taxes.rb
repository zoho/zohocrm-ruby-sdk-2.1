require 'ZOHOCRMSDK2_1'

class Tax
  def self.get_taxes
    # """
    # This method is used to get all the Organization Taxes and print the response.
    # """

    # Get instance of TaxesOperations Class
    to = ZOHOCRMSDK::Taxes::TaxesOperations.new
    # Call get_taxes method
    response = to.get_taxes
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
        # Check if expected ResponseWrapper instance is receiveds
        if response_handler.is_a? ZOHOCRMSDK::Taxes::ResponseWrapper
          # Get the list of obtained Tax instances
          taxes = response_handler.taxes
          taxes.each do |tax|
            # Get the DisplayLabel of each Tax
            print "\n Tax DisplayLabel:"
            print tax.display_label
            # Get the Name of each Tax
            print "\n Tax Name:"
            print tax.name
            # Get the Value of each Tax
            print "\n Tax Value:"
            print tax.value
            # Get the ID of each Tax
            print "\n Tax Id:"
            print tax.id.to_s
          end
          preference = response_handler.preference
          unless preference.nil?
            # Get the AutoPopulateTax of each Preference
            print "\n Preference AutoPopulateTax: "
            print preference.auto_populate_tax
            # Get the ModifyTaxRates of each Preference
            print "\n Preference ModifyTaxRates: "
            print preference.modify_tax_rates
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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

  def self.create_taxes
    # """
    # This method is used to create Organization Taxes and print the response.
    # """
    # Get instance of TaxesOperations Class
    to = ZOHOCRMSDK::Taxes::TaxesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    request = ZOHOCRMSDK::Taxes::BodyWrapper.new
    # List to hold Tax instances
    taxes = []
    for i in 3..4
      # Get instance of Tax Class
      tax = ZOHOCRMSDK::Taxes::Tax.new
      # Set Name
      tax.name = i.to_s
      # Set value
      tax.value = 2.0
      # Set sequence number
      tax.sequence_number
      # Add the instance to list
      taxes.push(tax)
    end
    # Set the list to taxes in BodyWrapper instance
    request.taxes = taxes
    # Call create_taxes method that takes BodyWrapper class instance as parameter
    response = to.create_taxes(request)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Taxes::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.taxes
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Taxes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Taxes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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

  def self.update_taxes
    # """
    # This method is used to update Organization Taxes and print the response.
    # """
    # Get instance of TaxesOperations Class
    to = ZOHOCRMSDK::Taxes::TaxesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    request = ZOHOCRMSDK::Taxes::BodyWrapper.new
    # List to hold Tax instances
    taxes = []
    taxes_ids = [347706112833002, 3_524_033__005_555_002]
    for i in 0..1
      tax = ZOHOCRMSDK::Taxes::Tax.new
      # Set ID
      tax.id = taxes_ids[i]
      # Set value
      tax.value = 2.0
      # Add the instance to list
      taxes.push(tax)
    end
    # Set the list to taxes in BodyWrapper instance
    request.taxes = taxes
    # Call update_taxes method that takes BodyWrapper class instance as parameter
    response = to.update_taxes(request)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Taxes::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.taxes
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Taxes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Taxes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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

  def self.delete_taxes(tax_ids)
    # """
    # This method is used to delete Organization Taxes and print the response.
    # :param tax_ids: The List of the tax IDs to be deleted
    # :return:
    # """

    # """
    # example
    # tax_ids = ["34096432407046", "34096432407047"]
    # """
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters for Delete Taxes operation
    tax_ids.each do |tax_id|
      pm.add(ZOHOCRMSDK::Taxes::TaxesOperations::DeleteTaxesParam.ids, tax_id)
    end
    # Get instance of TaxesOperations Class
    to = ZOHOCRMSDK::Taxes::TaxesOperations.new
    # Call delete_taxes method that takes ParameterMap instance as parameter
    response = to.delete_taxes(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Taxes::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.taxes
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Taxes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Taxes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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

  def self.get_tax(tax_id)
    # """
    # This method is used to get the Organization Tax with ID and print the response.
    # :param tax_id: The ID of the tax to be obtained
    # """

    # """
    # example
    # tax_id = '34096432317003'
    # """
    # Get instance of TaxesOperations Class
    to = ZOHOCRMSDK::Taxes::TaxesOperations.new
    # Call get_tax method that takes tax_id as parameter
    response = to.get_tax(tax_id)
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
        # Check if expected ResponseWrapper instance is receiveds
        if response_handler.is_a? ZOHOCRMSDK::Taxes::ResponseWrapper
          # Get the list of obtained Tax instances
          taxes = response_handler.taxes
          taxes.each do |tax|
            # Get the DisplayLabel of each Tax
            print "\n Tax DisplayLabel:"
            print tax.display_label
            # Get the Name of each Tax
            print "\n Tax Name:"
            print tax.name
            # Get the Value of each Tax
            print "\n Tax Value:"
            print tax.value
            # Get the ID of each Tax
            print "\n Tax Id:"
            print tax.id.to_s
          end
          preference = response_handler.preference
          unless preference.nil?
            # Get the AutoPopulateTax of each Preference
            print "\n Preference AutoPopulateTax: "
            print preference.auto_populate_tax
            # Get the ModifyTaxRates of each Preference
            print "\n Preference ModifyTaxRates: "
            print preference.modify_tax_rates
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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

  def self.delete_tax(tax_id)
    # """
    # This method is used to delete Organization Tax and print the response.
    # :param tax_id: The ID of the tax to be deleted
    # """

    # """
    # example
    # tax_id = '34096432407046'
    # """
    # Get instance of TaxesOperations Class
    to = ZOHOCRMSDK::Taxes::TaxesOperations.new
    # Call delete_tax method that takes tax_id as parameter
    response = to.delete_tax(tax_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Taxes::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.taxes
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Taxes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Taxes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Taxes::APIException
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
