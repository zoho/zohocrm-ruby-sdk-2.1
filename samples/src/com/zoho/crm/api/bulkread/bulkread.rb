require 'ZOHOCRMSDK2_1'

class Bulkread
  def self.create_bulk_read_job(module_api_name)
    # """
    # This method is used to create a bulk read job to export records.
    # :param module_api_name: The API Name of the record's module
    # """

    # """
    # example
    # module_api_name = 'Leads'
    # """
    # cvid = '30087501'
    # Get instance of BulkReadOperations Class
    bro = ZOHOCRMSDK::BulkRead::BulkReadOperations.new
    # Get instance of RequestWrapper Class that will contain the request body
    request_wrapper = ZOHOCRMSDK::BulkRead::RequestWrapper.new
    # Get instance of CallBack Class
    call_back = ZOHOCRMSDK::BulkRead::CallBack.new
    # Set valid callback URL
    call_back.url = 'https://www.example.com/callback'
    # Set the HTTP method of the callback URL. The allowed value is post.
    call_back.method = ZOHOCRMSDK::Util::Choice.new('post')
    # The Bulk Read Job's details is posted to this URL on successful completion / failure of the job.
    request_wrapper.callback = call_back
    # Get instance of Query Class
    query = ZOHOCRMSDK::BulkRead::Query.new
    module_1 =  ZOHOCRMSDK::Modules::Module.new
    module_1.api_name = module_api_name
    # Specifies the API Name of the module to be read
    query.module = module_1
    # Specifies the unique ID of the custom view, whose records you want to export.
    # query.cvid = cvid
    # List of field names
    field_api_names = ['Last_Name']
    # Specifies the API Name of the fields to be fetched
    query.fields = field_api_names
    # To set page value, By default value is 1.
    query.page = 1
    # Get instance of Criteria Class
    criteria = ZOHOCRMSDK::BulkRead::Criteria.new
    field = ZOHOCRMSDK::Fields::Field.new
    field.api_name = 'Created_Time'
    # To set API name of a field
    criteria.field = field
    # To set comparator(eg: equal, greater_than)
    criteria.comparator = ZOHOCRMSDK::Util::Choice.new('between')
    created_time = ['2020-06-03T17:31:48+05:30', '2020-06-03T17:31:48+05:30']
    # To set the value to be compared
    criteria.value = created_time
    # To filter the records to be exported
    query.criteria = criteria
    # Set the query object
    request_wrapper.query = query
    # Specify the value for this key as "ics" to export all records in the Events module as an ICS file.
    # request.set_file_type(ZOHOCRMSDK::Util::Choice.new('ics'))

    # Call create_bulk_read_job method that takes RequestWrapper instance as parameter
    response = bro.create_bulk_read_job(request_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::BulkRead::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if the request is successful
            if action_response.is_a? ZOHOCRMSDK::BulkRead::SuccessResponse
              success_response = action_response
              # Get the Code
              print "\ncode:"
              print success_response.code.value
              # Get the Status
              print "\nstatus:"
              print success_response.status.value
              # Get the Message
              print "\nmessage:"
              print success_response.message.value
              # Get the details map
              success_response.details.each do |k, v|
                print "\n"
                print k
                print " : "
                print v
                print "\n"
              end
            # Check if the request returned an exception
            elsif action_response.is_a? ZOHOCRMSDK::BulkRead::APIException
              api_exception = action_response
              # Get the Code
              print "\ncode:"
              print api_exception.code.value
              # Get the Status
              print "\nstatus:"
              print api_exception.status.value
              # Get the Message
              print "\nmessage:"
              print api_exception.message.value
              # Get the details map
              api_exception.details.each do |k, v|
                print "\n"
                print k
                print " : "
                print v
                print "\n"
              end
              print "\n"
            end
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
          exception = action_handler
          # Get the Code
          print "\n code:"
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
            print " : "
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

  def self.get_bulkread_job_details(job_id)
    # """
    # This method is used to get the details of a bulk read job performed previously.
    # :param job_id: The unique ID of the bulk read job.
    # """

    # """
    # example
    # job_id = '34096432461001'
    # """
    # Get instance of BulkReadOperations Class
    bro = ZOHOCRMSDK::BulkRead::BulkReadOperations.new
    # Call get_bulk_read_job_details method that takes jobId as parameter
    response = bro.get_bulk_read_job_details(job_id)
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
        if response_handler.is_a? ZOHOCRMSDK::BulkRead::ResponseWrapper
          # Get the list of JobDetail instances
          job_details = response_handler.data
          job_details.each do |job_detail|
            # Get the Job ID of each jobDetail
            print "\nBulk read Job ID: "
            print job_detail.id.to_s
            # Get the Operation of each jobDetail
            print "\nBulk read Operation: "
            print job_detail.operation
            # Get the Result instance of each jobDetail
            print "\nBulk read State: "
            print job_detail.state.value
            print "\n"
            # Get the Result instance of each jobDetail
            result = job_detail.result
            unless result.nil?
              # Get the Page of the Result
              print "\nBulkread Result Page:"
              print result.page
              # Get the Count of the Result
              print "\nBulkread Result Count:"
              print result.count
              # Get the Download URL of the Result
              print "\nBulkread Result Download URL:"
              print result.download_url
              # Get the Per_Page of the Result
              print "\nBulkread Result Per_Page:"
              print result.per_page
              # Get the MoreRecords of the Result
              print "\nBulkread Result MoreRecords:"
              print result.more_records
            end
            # Get the Query instance of each jobDetail
            query = job_detail.query
            unless query.nil?
              # Get the Module Name of the Query
              print "\nBulkread Query Module API NAME:"
              print query&.module&.api_name
              print "\nBulkread Query Module ID:"
              print query&.module&.id
              # Get the Page of the Query
              print "\nBulkread Query Page:"
              print query.page
              # Get the cvid of the Query
              print "\nBulkread  Query cvid:"
              print query.cvid
              # Get the fields List of the Query
              fields = query.fields
              fields&.each do |field_name|
                print "\nBulk read Query Fields:"
                print field_name
              end
              # Get the Criteria instance of the Query
              criteria = query.criteria
              print_criteria(criteria) unless criteria.nil?
            end
            # Get the CreatedBy User instance of each jobDetail
            created_by = job_detail.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\nBulkread Created By User-ID:"
              print created_by.id.to_s
              # Get the ID of the created_by User
              print "\nBulkread Created By user-Name:"
              print created_by.name
            end
            # Get the CreatedTime of each jobDetail
            print "\nBulkread CreatedTime:"
            print job_detail.created_time
            # Get the FileType of each jobDetail
            print "\nBulkread File Type:"
            print job_detail.file_type
          end
        elsif response_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
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
      else status_code != 204
           response_object = response.data_object
           response_object.instance_variables.each do |field|
             print field
             print "\n"
             print response_object.instance_variable_get(field)
           end
      end
    end
  end

  def self.download_result(job_id, destination_folder)
    # """
    # This method is used to download the result of Bulk Read operation
    # :param job_id: The unique ID of the bulk read job.
    # :param destination_folder: The absolute path where downloaded file has to be stored.
    # """

    # """
    # example
    # job_id = '34096432461001'
    # """
    # Get instance of BulkReadOperations Class
    bro = ZOHOCRMSDK::BulkRead::BulkReadOperations.new
    # Call download_result method that takes job_id as parameter
    response = bro.download_result(job_id)
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
        # Check if expected FileBodyWrapper instance is received.
        if response_handler.is_a? ZOHOCRMSDK::BulkRead::FileBodyWrapper
          file_body_wrapper = response_handler
          # Get StreamWrapper instance from the returned FileBodyWrapper instance
          stream_wrapper = file_body_wrapper.file
          # Construct the file name by joining the destinationFolder and the name from StreamWrapper instance
          # Open the destination file where the file needs to be written in 'w' mode
          File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
        # Check if the request returned an exception`
        elsif response_handler.is_a? ZOHOCRMSDK::BulkRead::APIException
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

  def self.print_criteria(criteria)
    # Get the Comparator of the Criteria
    unless criteria.comparator.nil?
      print "\n Bulk read Query  Criteria Comparator:"
      print criteria.comparator.value
    end
    # Get the Value of the Criteria
    unless criteria.value.nil?
      print "\n Bulk read Query Criteria Value::"
      print criteria.value
    end
    # Get the Value of the field
    unless criteria.field.nil?
      print "\n Bulk read Query Criteria field::"
      print criteria.field.api_name
    end
    # Get the API Name of the Criteria
    print "\n Bulk read Query  Criteria APIName:"
    print criteria.api_name
    criteria_group = criteria.group
    criteria_group&.each do |criteria|
      print_criteria(criteria)
    end
    # Get the List of Criteria instance of each Criteria
    unless criteria.group_operator.nil?
      # Get the Group Operator of the Criterias
      print "\n Bulk read Query  Criteria Group Operator: "
      print criteria.group_operator.value
    end
  end
end
