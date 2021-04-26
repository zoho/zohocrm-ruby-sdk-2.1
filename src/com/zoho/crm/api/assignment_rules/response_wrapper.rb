require_relative '../util/model'

module AssignmentRules
  require_relative 'response_handler'
  class ResponseWrapper
    include Util::Model
    include ResponseHandler

    # Creates an instance of ResponseWrapper
    def initialize
      @assignment_rules = nil
      @key_modified = Hash.new
    end

      # The method to get the assignment_rules
      # @return An instance of Array

    def assignment_rules
      @assignment_rules
    end

      # The method to set the value to assignment_rules
      # @param assignment_rules [Array] An instance of Array

    def assignment_rules=(assignment_rules)
      if assignment_rules!=nil and !assignment_rules.is_a? Array
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: assignment_rules EXPECTED TYPE: Array', nil, nil)
      end
      @assignment_rules = assignment_rules
      @key_modified['assignment_rules'] = 1
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
