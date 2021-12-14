require 'ZOHOCRMSDK2_1'

class Currency
  def self.get_currencies
    # """
    # This method is used to get all the available currencies in your organization.
    # """
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    # Call get_currencies method
    response = co.get_currencies

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
        if response_handler.is_a? ZOHOCRMSDK::Currencies::ResponseWrapper
          # Get the list of Currency instances
          currencies = response_handler.currencies
          currencies.each do |currency|
            # Get the Symbol of each currency
            print "\nCurrency Symbol: "
            print currency.symbol
            # Get the CreatedTime of each currency
            print "\nCurrency CreatedTime: "
            print currency.created_time
            # Get if the currency is active
            print "\nCurrency IsActive: "
            print currency.is_active
            # Get the ExchangeRate of each currency
            print "\nCurrency ExchangeRate: "
            print currency.exchange_rate
            # Get the format instance of each currency
            format = currency.format
            unless format.nil?
              # Get the DecimalSeparator of the Format
              print "\nCurrency Format DecimalSeparator: "
              print format.decimal_separator.value
              # Get the ThousandSeparator of the Format
              print "\nCurrency Format ThousandSeparator: "
              print format.thousand_separator.value
              # Get the DecimalPlaces of the Format
              print "\nCurrency Format DecimalPlaces: "
              print format.decimal_places.value
            end
            # Get the createdBy User instance of each currency
            created_by = currency.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\nCurrency CreatedBy User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\nCurrency CreatedBy User-Id: "
              print created_by.id.to_s
            end
            # Get the PrefixSymbol of each currency
            print "\nCurrency PrefixSymbol: "
            print currency.prefix_symbol
            # Get the IsBase of each currency
            print "\nCurrency IsBase: "
            print currency.is_base
            # Get the ModifiedTime of each currency
            print "\nCurrency ModifiedTime: "
            print currency.modified_time
            # Get the Name of each currency
            print "\nCurrency Name: "
            print currency.name
            # Get the createdBy User instance of each currency
            modified_by = currency.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\nCurrency ModifiedBy User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\nCurrency ModifiedBy User-Id: "
              print modified_by.id.to_s
            end
            # Get the Id of each currency
            print "\nCurrency ID: "
            print currency.id.to_s
            # Get the IsoCode of each currency
            print "\nCurrency IsoCode: "
            print currency.iso_code
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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
          # Get the details map
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

  def self.add_currencies
    # """
    # This method is used to add new currencies to your organization.
    # """
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Currencies::BodyWrapper.new
    # Get instance of Currency Class
    currency = ZOHOCRMSDK::Currencies::Currency.new
    currency.prefix_symbol = true
    # To set the name of the currency.
    currency.name = 'Angolan Kwanza - AOA'
    # To set the position of the ISO code in the currency.
    # True: Display ISO code before the currency value.
    # False: Display ISO code after the currency value.
    currency.iso_code = 'DZD'
    # To set the ISO code of the currency.
    # currency.set_iso_code("AOA")

    # To set the symbol of the currency.
    currency.symbol = 'Kz'
    # To set the rate at which the currency has to be exchanged for home currency
    currency.exchange_rate = '20.'
    # To set the status of the currency.
    # True: The currency is active.
    # False: The currency is inactive.
    currency.is_active = true
    format = ZOHOCRMSDK::Currencies::Format.new
    # It can be a Period or Comma, depending on the currency.
    format.decimal_separator = ZOHOCRMSDK::Util::Choice.new('Period')
    # It can be a Period, Comma, or Space, depending on the currency.
    format.thousand_separator = ZOHOCRMSDK::Util::Choice.new('Comma')
    # To set the number of decimal places allowed for the currency. It can be 0, 2, or 3
    format.decimal_places = ZOHOCRMSDK::Util::Choice.new('2')
    # To set the format of the currency
    # currency.set_format(format)
    currency.format = format
    # List to hold Currency instances
    currencies = [currency]
    # Set the list to Currency in BodyWrapper instance
    bw.currencies = currencies
    # Call add_currencies method that takes BodyWrapper instance as parameter
    response = co.add_currencies(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Currencies::ActionWrapper
          action_wrapper = action_handler
          # Get the obtained ActionResponse instances
          action_responses = action_wrapper.currencies
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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

  def self.update_currencies
    # """
    # This method is used to update currency details.
    # """
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Currencies::BodyWrapper.new
    # Get instance of Currency Class
    currency = ZOHOCRMSDK::Currencies::Currency.new
    currency.prefix_symbol = true
    # To set the name of the currency.
    currency.name = 'Angolan Kwanza - AOA'
    # To set the position of the ISO code in the currency.
    # True: Display ISO code before the currency value.
    # False: Display ISO code after the currency value.
    currency.iso_code = 'DZD'
    # To set the ISO code of the currency.
    # currency.set_iso_code("AOA")
    # To set ID of the currency.
    currency.id = 3_524_033__002_007_001

    # To set the symbol of the currency.
    currency.symbol = 'Kz'
    # To set the rate at which the currency has to be exchanged for home currency
    currency.exchange_rate = '20.'
    # To set the status of the currency.
    # True: The currency is active.
    # False: The currency is inactive.
    currency.is_active = true
    format = ZOHOCRMSDK::Currencies::Format.new
    # It can be a Period or Comma, depending on the currency.
    format.decimal_separator = ZOHOCRMSDK::Util::Choice.new('Period')
    # It can be a Period, Comma, or Space, depending on the currency.
    format.thousand_separator = ZOHOCRMSDK::Util::Choice.new('Comma')
    # To set the number of decimal places allowed for the currency. It can be 0, 2, or 3
    format.decimal_places = ZOHOCRMSDK::Util::Choice.new('2')
    # To set the format of the currency
    # currency.set_format(format)
    currency.format = format
    # List to hold Currency instances
    currencies = [currency]
    # Set the list to Currency in BodyWrapper instance
    bw.currencies = currencies
    # Call update_currencies method that takes BodyWrapper instance as parameter
    response = co.update_currencies(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Currencies::ActionWrapper
          action_wrapper = action_handler
          # Get the obtained ActionResponse instances
          action_responses = action_wrapper.currencies
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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

  def self.enable_multiple_currencies
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    bcw = ZOHOCRMSDK::Currencies::BaseCurrencyWrapper.new
    # Get instance of Currency Class
    currency = ZOHOCRMSDK::Currencies::Currency.new
    currency.prefix_symbol = true
    # To set the name of the currency.
    currency.name = 'Angolan Kwanza - AOA'
    # To set the position of the ISO code in the currency.
    # True: Display ISO code before the currency value.
    # False: Display ISO code after the currency value.
    currency.iso_code = 'DZD'
    # To set the ISO code of the currency.
    # currency.set_iso_code("AOA")

    # To set the symbol of the currency.
    currency.symbol = 'Kz'
    # To set the rate at which the currency has to be exchanged for home currency
    currency.exchange_rate = '20.'
    # To set the status of the currency.
    # True: The currency is active.
    # False: The currency is inactive.
    currency.is_active = true
    format = ZOHOCRMSDK::Currencies::Format.new
    # It can be a Period or Comma, depending on the currency.
    format.decimal_separator = ZOHOCRMSDK::Util::Choice.new('Period')
    # It can be a Period, Comma, or Space, depending on the currency.
    format.thousand_separator = ZOHOCRMSDK::Util::Choice.new('Comma')
    # To set the number of decimal places allowed for the currency. It can be 0, 2, or 3
    format.decimal_places = ZOHOCRMSDK::Util::Choice.new('2')
    # To set the format of the currency
    # currency.set_format(format)
    currency.format = format
    # Set the Currency in BodyWrapper instance
    bcw.base_currency = currency
    # Call enable_multiple_currencies method that takes BaseCurrencyWrapper instance as parameter
    response = co.enable_multiple_currencies(bcw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected BaseCurrencyActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Currencies::BaseCurrencyActionWrapper
          action_wrapper = action_handler
          # Get the obtained ActionResponse instances
          action_response = action_wrapper.base_currency

          # Check if expected SuccessResponse instance is received
          if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
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
          elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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

  def self.update_base_currency
    # """
    # This method is used to update base currency details.
    # """
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    # Get instance of BaseCurrencyWrapper Class that will contain the request body
    bcw = ZOHOCRMSDK::Currencies::BaseCurrencyWrapper.new
    # Get instance of Currency Class
    currency = ZOHOCRMSDK::Currencies::Currency.new
    currency.prefix_symbol = true
    # To set the name of the currency.
    currency.name = 'Angolan Kwanza - AOA'
    # To set the position of the ISO code in the currency.
    # True: Display ISO code before the currency value.
    # False: Display ISO code after the currency value.
    currency.iso_code = 'DZD'
    # To set the ISO code of the currency.
    # currency.set_iso_code("AOA")
    # To set ID of the currency.
    currency.id = 3_524_033__002_007_001
    # To set the symbol of the currency.
    currency.symbol = 'Kz'
    # To set the rate at which the currency has to be exchanged for home currency
    currency.exchange_rate = '20.'
    # To set the status of the currency.
    # True: The currency is active.
    # False: The currency is inactive.
    currency.is_active = true
    format = ZOHOCRMSDK::Currencies::Format.new
    # It can be a Period or Comma, depending on the currency.
    format.decimal_separator = ZOHOCRMSDK::Util::Choice.new('Period')
    # It can be a Period, Comma, or Space, depending on the currency.
    format.thousand_separator = ZOHOCRMSDK::Util::Choice.new('Comma')
    # To set the number of decimal places allowed for the currency. It can be 0, 2, or 3
    format.decimal_places = ZOHOCRMSDK::Util::Choice.new('2')
    # To set the format of the currency
    # currency.set_format(format)
    currency.format = format
    # Set the Currency in BodyWrapper instance
    bcw.base_currency = currency
    # Call update_base_currency method that takes BaseCurrencyWrapper instance as parameter
    response = co.update_base_currency(bcw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected BaseCurrencyActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Currencies::BaseCurrencyActionWrapper
          action_response = action_handler.base_currency

          # Check if expected SuccessResponse instance is received
          if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
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
          elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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

  def self.get_currency(current_id)
    # """
    # This method is used to get the details of a specific currency.
    # :param currency_id: Specify the unique ID of the currency.
    # """

    # """
    # example
    # currency_id = "34096432293037";
    # """
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    # Call get_currency method that takes currency_id as parameter
    response = co.get_currency(current_id)

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
        if response_handler.is_a? ZOHOCRMSDK::Currencies::ResponseWrapper
          # Get the list of Currency instances
          currencies = response_handler.currencies
          currencies.each do |currency|
            # Get the Symbol of each currency
            print "\nCurrency Symbol: "
            print currency.symbol
            # Get the CreatedTime of each currency
            print "\nCurrency CreatedTime: "
            print currency.created_time
            # Get if the currency is active
            print "\nCurrency IsActive: "
            print currency.is_active
            # Get the ExchangeRate of each currency
            print "\nCurrency ExchangeRate: "
            print currency.exchange_rate
            # Get the format instance of each currency
            format = currency.format
            unless format.nil?
              # Get the DecimalSeparator of the Format
              print "\nCurrency Format DecimalSeparator: "
              print format.decimal_separator.value
              # Get the ThousandSeparator of the Format
              print "\nCurrency Format ThousandSeparator: "
              print format.thousand_separator.value
              # Get the DecimalPlaces of the Format
              print "\nCurrency Format DecimalPlaces: "
              print format.decimal_places.value
            end
            # Get the createdBy User instance of each currency
            created_by = currency.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\nCurrency CreatedBy User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\nCurrency CreatedBy User-Id: "
              print created_by.id.to_s
            end
            # Get the PrefixSymbol of each currency
            print "\nCurrency PrefixSymbol: "
            print currency.prefix_symbol
            # Get the IsBase of each currency
            print "\nCurrency IsBase: "
            print currency.is_base
            # Get the ModifiedTime of each currency
            print "\nCurrency ModifiedTime: "
            print currency.modified_time
            # Get the Name of each currency
            print "\nCurrency Name: "
            print currency.name
            # Get the createdBy User instance of each currency
            modified_by = currency.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\nCurrency ModifiedBy User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\nCurrency ModifiedBy User-Id: "
              print modified_by.id.to_s
            end
            # Get the Id of each currency
            print "\nCurrency ID: "
            print currency.id.to_s
            # Get the IsoCode of each currency
            print "\nCurrency IsoCode: "
            print currency.iso_code
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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
          # Get the details map
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

  def self.update_currency(current_id)
    # """
    # This method is used to update single currency details.
    # :param currency_id: Specify the unique ID of the currency.
    # """

    # """
    # example
    # currency_id = "34096432293037";
    # """
    # Get instance of CurrenciesOperations Class
    co = ZOHOCRMSDK::Currencies::CurrenciesOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Currencies::BodyWrapper.new
    # Get instance of Currency Class
    currency = ZOHOCRMSDK::Currencies::Currency.new

    currency.prefix_symbol = true
    # To set the name of the currency.
    currency.name = 'Angolan Kwanza - AOA'
    # To set the position of the ISO code in the currency.
    # True: Display ISO code before the currency value.
    # False: Display ISO code after the currency value.
    currency.iso_code = 'DZD'
    # To set the ISO code of the currency.
    # currency.set_iso_code("AOA")

    # To set the symbol of the currency.
    currency.symbol = 'Kz'
    # To set the rate at which the currency has to be exchanged for home currency
    currency.exchange_rate = '20.'
    # To set the status of the currency.
    # True: The currency is active.
    # False: The currency is inactive.
    currency.is_active = true
    format = ZOHOCRMSDK::Currencies::Format.new
    # It can be a Period or Comma, depending on the currency.
    format.decimal_separator = ZOHOCRMSDK::Util::Choice.new('Period')
    # It can be a Period, Comma, or Space, depending on the currency.
    format.thousand_separator = ZOHOCRMSDK::Util::Choice.new('Comma')
    # To set the number of decimal places allowed for the currency. It can be 0, 2, or 3
    format.decimal_places = ZOHOCRMSDK::Util::Choice.new('2')
    # To set the format of the currency
    # currency.set_format(format)
    currency.format = format
    # List to hold Currency instances
    currencies = [currency]
    # Set the list to Currency in BodyWrapper instance
    bw.currencies = currencies
    # Call update_currencies method that takes BodyWrapper instance as parameter
    response = co.update_currency(current_id,bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Currencies::ActionWrapper
          action_wrapper = action_handler
          # Get the obtained ActionResponse instances
          action_responses = action_wrapper.currencies
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received
            if action_response.is_a? ZOHOCRMSDK::Currencies::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Currencies::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Currencies::APIException
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
