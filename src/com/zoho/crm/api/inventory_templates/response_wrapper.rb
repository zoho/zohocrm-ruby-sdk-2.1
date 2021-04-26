require_relative '../record/info'
require_relative '../util/model'

module InventoryTemplates
  require_relative 'response_handler'
  class ResponseWrapper
    include Util::Model
    include ResponseHandler

    # Creates an instance of ResponseWrapper
    def initialize
      @inventory_templates = nil
      @info = nil
      @key_modified = Hash.new
    end

      # The method to get the inventory_templates
      # @return An instance of Array

    def inventory_templates
      @inventory_templates
    end

      # The method to set the value to inventory_templates
      # @param inventory_templates [Array] An instance of Array

    def inventory_templates=(inventory_templates)
      if inventory_templates!=nil and !inventory_templates.is_a? Array
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: inventory_templates EXPECTED TYPE: Array', nil, nil)
      end
      @inventory_templates = inventory_templates
      @key_modified['inventory_templates'] = 1
    end

      # The method to get the info
      # @return An instance of Record::Info

    def info
      @info
    end

      # The method to set the value to info
      # @param info [Record::Info] An instance of Record::Info

    def info=(info)
      if info!=nil and !info.is_a? Record::Info
        raise SDKException.new(Constants::DATA_TYPE_ERROR, 'KEY: info EXPECTED TYPE: Info', nil, nil)
      end
      @info = info
      @key_modified['info'] = 1
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
