require 'ZCRMSDK'
module SingleUser
  class MultiThreading
    def initialize(module_api_name)
      @module_api_name = module_api_name
    end

    def execute
      # this block will be executed in sequence
      t1 = Thread.new{ func1}
      t2 = Thread.new{func1}
      t3 = Thread.new{func1}
      t4 = Thread.new{func1}
      t1.join
      t2.join
      t3.join
      t4.join
    end

    def func1
      # Get instance of RecordOperations Class
      ro = Record::RecordOperations.new
      ro.get_records(@module_api_name,nil,nil)
      # print ro.data_objects
    end
  end
end
