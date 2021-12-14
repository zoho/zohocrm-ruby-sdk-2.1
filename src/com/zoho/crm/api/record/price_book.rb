require_relative '../record/record'
require_relative '../util/model'

module ZOHOCRMSDK
  module Record
    class PriceBook < Record
      include Util::Model

      # Creates an instance of PriceBook
      def initialize
        super
      end

        # The method to get the name
        # @return A String value

      def name
        get_key_value('name')
      end

        # The method to set the value to name
        # @param name [String] A String

      def name=(name)
        if name!=nil and !name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: name EXPECTED TYPE: String', nil, nil)
        end
        add_key_value('name', name)
      end

    end
  end
end
