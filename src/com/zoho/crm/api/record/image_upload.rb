require_relative '../util/model'

module ZOHOCRMSDK
  module Record
    class ImageUpload
      include Util::Model

      # Creates an instance of ImageUpload
      def initialize
        @description = nil
        @preview_id = nil
        @encrypted_id = nil
        @file_name = nil
        @state = nil
        @file_id = nil
        @size = nil
        @sequence_number = nil
        @id = nil
        @key_modified = Hash.new
      end

        # The method to get the description
        # @return A String value

      def description
        @description
      end

        # The method to set the value to description
        # @param description [String] A String

      def description=(description)
        if description!=nil and !description.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: description EXPECTED TYPE: String', nil, nil)
        end
        @description = description
        @key_modified['Description'] = 1
      end

        # The method to get the preview_id
        # @return A String value

      def preview_id
        @preview_id
      end

        # The method to set the value to preview_id
        # @param preview_id [String] A String

      def preview_id=(preview_id)
        if preview_id!=nil and !preview_id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: preview_id EXPECTED TYPE: String', nil, nil)
        end
        @preview_id = preview_id
        @key_modified['Preview_Id'] = 1
      end

        # The method to get the encrypted_id
        # @return A String value

      def encrypted_id
        @encrypted_id
      end

        # The method to set the value to encrypted_id
        # @param encrypted_id [String] A String

      def encrypted_id=(encrypted_id)
        if encrypted_id!=nil and !encrypted_id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: encrypted_id EXPECTED TYPE: String', nil, nil)
        end
        @encrypted_id = encrypted_id
        @key_modified['Encrypted_Id'] = 1
      end

        # The method to get the file_name
        # @return A String value

      def file_name
        @file_name
      end

        # The method to set the value to file_name
        # @param file_name [String] A String

      def file_name=(file_name)
        if file_name!=nil and !file_name.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: file_name EXPECTED TYPE: String', nil, nil)
        end
        @file_name = file_name
        @key_modified['File_Name'] = 1
      end

        # The method to get the state
        # @return A String value

      def state
        @state
      end

        # The method to set the value to state
        # @param state [String] A String

      def state=(state)
        if state!=nil and !state.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: state EXPECTED TYPE: String', nil, nil)
        end
        @state = state
        @key_modified['State'] = 1
      end

        # The method to get the file_id
        # @return A String value

      def file_id
        @file_id
      end

        # The method to set the value to file_id
        # @param file_id [String] A String

      def file_id=(file_id)
        if file_id!=nil and !file_id.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: file_id EXPECTED TYPE: String', nil, nil)
        end
        @file_id = file_id
        @key_modified['File_Id'] = 1
      end

        # The method to get the size
        # @return A Integer value

      def size
        @size
      end

        # The method to set the value to size
        # @param size [Integer] A Integer

      def size=(size)
        if size!=nil and !size.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: size EXPECTED TYPE: Integer', nil, nil)
        end
        @size = size
        @key_modified['Size'] = 1
      end

        # The method to get the sequence_number
        # @return A Integer value

      def sequence_number
        @sequence_number
      end

        # The method to set the value to sequence_number
        # @param sequence_number [Integer] A Integer

      def sequence_number=(sequence_number)
        if sequence_number!=nil and !sequence_number.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: sequence_number EXPECTED TYPE: Integer', nil, nil)
        end
        @sequence_number = sequence_number
        @key_modified['Sequence_Number'] = 1
      end

        # The method to get the id
        # @return A Integer value

      def id
        @id
      end

        # The method to set the value to id
        # @param id [Integer] A Integer

      def id=(id)
        if id!=nil and !id.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: id EXPECTED TYPE: Integer', nil, nil)
        end
        @id = id
        @key_modified['id'] = 1
      end

        # The method to check if the user has modified the given key
        # @param key [String] A String
        # @return A Integer value

      def is_key_modified(key)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if @key_modified.key?(key)
          return @key_modified[key]
        end

        nil
      end

        # The method to mark the given key as modified
        # @param key [String] A String
        # @param modification [Integer] A Integer

      def set_key_modified(key, modification)
        if key!=nil and !key.is_a? String
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: key EXPECTED TYPE: String', nil, nil)
        end
        if modification!=nil and !modification.is_a? Integer
          raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: modification EXPECTED TYPE: Integer', nil, nil)
        end
        @key_modified[key] = modification
      end

    end
  end
end
