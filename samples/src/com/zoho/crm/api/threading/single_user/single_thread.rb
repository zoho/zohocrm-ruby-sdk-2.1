require 'ZOHOCRMSDK2_1'
module SingleUser
  class SingleThreading
    def initialize(module_api_name)
      @module_api_name = module_api_name
    end

    def execute
      func1
    end

    def func1
      print 'hi'
      # Get instance of RecordOperations Class
      ro = ZOHOCRMSDK::Record::RecordOperations.new
      rersponse = ro.get_records(@module_api_name,nil,nil)
      print "\n\n\n"
      print rersponse.data_object.inspect
    end
  end
end
