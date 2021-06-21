require 'ZCRMSDK'

class Bulkwrite
  def self.upload_file(org_id, absolute_file_path)
    # """
    # This method is used to upload a CSV file in ZIP format for bulk write API. The response contains the file_id.
    # :param org_id: The unique ID (zgid) of your organization obtained through the Organization API.
    # :param absolute_file_path: The absoluteFilePath of the zip file you want to upload.
    # """

    # """
    # example
    # org_id = "586"
    # absolute_file_path = "/Users/user_name/Documents/Leads.zip"
    # """
    # Get instance of BulkWriteOperations Class
    bwo = BulkWrite::BulkWriteOperations.new
    # Get instance of FileBodyWrapper class that will contain the request file
    file_body_wrapper = BulkWrite::FileBodyWrapper.new
    # """
    # StreamWrapper can be initialized in any of the following ways

    # * param 1 -> fileName
    # * param 2 -> Read Stream.
    # * param 3 -> Absolute File Path of the file to be attached
    # """
    # stream_wrapper = StreamWrapper.new(name,stream,absolutefilepath)
    sw = Util::StreamWrapper.new(nil, nil, absolute_file_path)
    # Set file to the FileBodyWrapper instance
    file_body_wrapper.file = sw
    # Get instance of HeaderMap Class
    header_instance = HeaderMap.new
    # Possible headers for upload_file operation
    header_instance.add(BulkWrite::BulkWriteOperations::UploadFileHeader.feature, 'bulk-write')
    header_instance.add(BulkWrite::BulkWriteOperations::UploadFileHeader.X_crm_org, org_id)
    # Call upload_file method that takes FileBodyWrapper instance and header_instance as parameter
    response = bwo.upload_file(file_body_wrapper, header_instance)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_response = response.data_object
        # Check if expected SuccessResponse instance is received
        if action_response.is_a? BulkWrite::SuccessResponse
          success_response = action_response
          # Get the Code
          print "\n code:"
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
        elsif action_response.is_a? BulkWrite::APIException
          api_exception = action_response
          # Get the Code
          print "\n code:"
          print api_exception.code.value
          # Get the Status
          print "\n status:"
          print api_exception.status.value
          # Get the Message
          print "\n message:"
          print api_exception.message.value
          # Get the ErrorMessage
          if api_exception.error_message.nil?
            print "\n ErrorMessage:"
            print api_exception.error_message.value
          end
          # Get the ErrorCode
          if api_exception.error_code.nil?
            print "\n ErrorCode:"
            print api_exception.error_code
          end
          # Get the XError
          if api_exception.x_error.nil?
            print "\n XError:"
            print api_exception.x_error.value
          end
          # Get the Info
          if api_exception.info.nil?
            print "\n Infi:"
            print api_exception.info.value
          end
          # Get the XInfo
          if api_exception.x_info.nil?
            print "\n XInfo:"
            print api_exception.x_info.value
          end
          print "\n HttpStatus:"
          print api_exception.http_status
          # Get the details map
          api_exception.details.each do |k, v|
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

  def self.create_bulk_write_job(module_api_name, file_id)
    # """
    # This method is used to create bulk write job with the uploaded file ID
    # :param module_api_name: The API Name of the module.
    # :param file_id: The ID of the uploaded file to create BulkWrite Job.
    # """
    # Get instance of BulkWriteOperations Class
    bwo = BulkWrite::BulkWriteOperations.new
    # Get instance of RequestWrapper Class that will contain the request body
    request_wrapper = BulkWrite::RequestWrapper.new
    # Get instance of CallBack Class
    call_back = BulkWrite::CallBack.new
    # Set valid callback URL
    call_back.url = 'https://www.example.com/callback'
    # Set the HTTP method of the callback URL. The allowed value is post.
    call_back.method = Util::Choice.new('post')
    # The Bulk Read Job's details is posted to this URL on successful completion / failure of the job.
    request_wrapper.callback = call_back
    # Set the charset of the uploaded file
    request_wrapper.character_encoding = 'UTF-8'
    # To set the type of operation you want to perform on the bulk write job.
    request_wrapper.operation = Util::Choice.new('insert')
    # Get instance of Resource Class
    resource_ins = BulkWrite::Resource.new
    # To set the type of module that you want to import. The value is data.
    resource_ins.type = Util::Choice.new('data')
    # To set the fileId obtained from file upload API.
    resource_ins.file_id = file_id
    # True - Ignores the empty values.The default value is false.
    resource_ins.ignore_empty = true
    # Get instance of FieldMapping Class
    field_mapping0 = BulkWrite::FieldMapping.new
    # To set API name of the field present in Zoho module object that you want to import.
    field_mapping0.api_name = 'Last_Name'
    # To set the column index of the field you want to map to the CRM field.
    field_mapping0.index = 0
    field_mapping1 = BulkWrite::FieldMapping.new
    field_mapping1.api_name = 'Email'
    field_mapping1.index = 1
    field_mapping2 = BulkWrite::FieldMapping.new
    field_mapping2.api_name = 'Company'
    field_mapping2.index = 2
    field_mapping3 = BulkWrite::FieldMapping.new
    field_mapping3.api_name = 'Phone'
    field_mapping3.index = 3
    field_mapping4 = BulkWrite::FieldMapping.new
    field_mapping4.api_name = 'Website'
    module_1=  Modules::Module.new
    module_1.api_name = "Leads"
    # To set the default value for an empty column in the uploaded file.
    default_value = { 'value' => 'https://www.zohoapis.com' }
    # To set the default value for an empty column in the uploaded file.
    field_mapping4.default_value = default_value
    field_mappings = [field_mapping0, field_mapping1, field_mapping2, field_mapping3, field_mapping4]
    resource_ins.field_mappings = field_mappings
    resource_ins.module = module_1
    resource = [resource_ins]
    # Set the list of resources to RequestWrapper instance
    request_wrapper.resource = resource
    # Call create_bulk_write_job method that takes RequestWrapper instance as parameter
    response = bwo.create_bulk_write_job(request_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_response = response.data_object
        # Check if expected SuccessResponse instance is received
        if action_response.is_a? BulkWrite::SuccessResponse
          success_response = action_response
          # Get the Code
          print "\n code:"
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

        elsif action_response.is_a? BulkWrite::APIException
          api_exception = action_response
          # Get the Code
          print "\n code:"
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

  def self.get_bulk_write_job_details(job_id)
    # """
    # This method is used to get the details of a bulk write job performed previously.
    # :param job_id: The unique ID of the bulk write job.
    # """

    # """
    # example
    # job_id = "347706105615003"
    # """
    # Get instance of BulkWriteOperations Class
    bwo = BulkWrite::BulkWriteOperations.new
    # Call get_bulk_write_job_details method that takes job_id as parameter
    response = bwo.get_bulk_write_job_details(job_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      #Check if expected  instance is received
      if response.is_expected
        response_wrapper = response.data_object
        # Check if expected BulkWriteResponse instance is received
        if response_wrapper.is_a? BulkWrite::BulkWriteResponse
          bulk_write_response = response_wrapper
          # Get the Job Status of the bulkWriteResponse
          print "\n Bulk write Job Status: "
          print bulk_write_response.status
          # Get the CharacterEncoding of the bulkWriteResponse
          print "\n Bulk write CharacterEncoding: "
          print bulk_write_response.character_encoding
          resources = bulk_write_response.resource
          # Get the Status of each Resource
          # Get the Type of each Resource
          # Get the Module of each Resource
          # Get the APIName of each FieldMapping
          # Get the Index of each FieldMapping
          # Get the Format of each FieldMapping
          # Get the FindBy of each FieldMapping
          # Get the file
          # Get the Status of the File
          # Get the Name of the File
          # Get the AddedCount of the File
          # Get the SkippedCount of the File
          # Get the UpdatedCount of the File
          # Get the TotalCount of the File
          resources&.each do |resource|
            # Get the Status of each Resource
            print "\n Bulk write Resource Status: "
            print resource.status.value
            # Get the Type of each Resource
            print "\n Bulk write Resource Type: "
            print resource.type.value
            # Get the Module of each Resource
            print "\n Bulk write Resource Module: "
            print resource&.module&.id
            print resource&.module&.api_name
            field_mappings = resource.field_mappings
            # Get the FindBy of each FieldMapping
            field_mappings&.each do |field_mapping|
              # Get the APIName of each FieldMapping
              print "\n Bulk write Resource FieldMapping Module: "
              print field_mapping.api_name
              unless field_mapping.index.nil?
                # Get the Index of each FieldMapping
                print "\n Bulk write Resource FieldMapping Index: "
                print field_mapping.index
              end
              unless field_mapping.format.nil?
                # Get the Format of each FieldMapping
                print "\n Bulk write Resource FieldMapping Format: "
                print field_mapping.format
              end
              unless field_mapping.module.nil?
                # Get the Module of each FieldMapping
                print "\n Bulk write Resource FieldMapping Module: "
                print field_mapping.module
              end
              unless field_mapping.find_by.nil?
                # Get the FindBy of each FieldMapping
                print "\n Bulk write Resource FieldMapping FindBy: "
                print field_mapping.find_by
              end
              field_mapping.default_value&.each do |k, v|
                print "\n "
                print k
                print v
                print "\n"
              end
            end
            # Get the file
            file = resource.file
            unless file.nil?
              # Get the Status of the File
              print "\n Bulk write Resource File Status: "
              # Get the Name of the File
              print file.status.value
              print "\n Bulk write Resource File Name: "
              print file.name
              # Get the AddedCount of the File
              print "\n Bulk write Resource AddedCount: "
              print file.added_count
              # Get the SkippedCount of the File
              print "\n Bulk write Resource SkippedCount: "
              print file.skipped_count
              # Get the UpdatedCount of the File
              print "\n Bulk write Resource UpdatedCount: "
              print file.updated_count
              # Get the TotalCount of the File
              print "\n Bulk write Resource TotalCount: "
              print file.total_count
            end
          end
          # Get the BulkWrite ID
          print "\n Bulk write ID: "
          print bulk_write_response.id.to_s

          callback = bulk_write_response.callback
          if callback.nil?
            # Get the CallBack Url
            print "\n Bulk write CallBack Url: "
            print callback.url
            # Get the CallBack Method
            print "\n Bulk write CallBack Method:  "
            print callback.method.value
          end
          result = bulk_write_response.result
          unless result.nil?
            # Get the DownloadUrl of the Result
            print "\n Bulk write DownloadUrl: "
            print result.download_url
          end
          # Get the CreatedBy User instance of the BulkWriteResponse
          created_by = bulk_write_response.created_by
          # Check if created_by is not None
          unless created_by.nil?
            # Get the Name of the created_by User
            print "\n Bulk write Created By User-ID: "
            print created_by.id.to_s
            # Get the ID of the created_by User
            print "\n Bulk write Created By user-Name:"
            print created_by.name
          end
          # Get the Operation of the BulkWriteResponse
          print "\n Bulk write Operation: "
          print bulk_write_response.operation
          # Get the CreatedTime of the BulkWriteResponse
          print "\n Bulk write File CreatedTime: "
          print bulk_write_response.created_time
        elsif response_wrapper.is_a? BulkWrite::APIException
          exception = response_wrapper
          # Get the Code
          print "\n code:"
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

  def self.download_bulk_write_result(download_url, destination_folder)
    # """
    # This method is used to download the result of bulk write job.
    # :param download_url: The URL present in the download_url key in the response of Get Bulk Write Job Details.
    # :param destination_folder: The absolute path where downloaded file has to be stored.
    # """

    # """
    # example
    # download_url = "https://download-accl.zoho.com/v2/crm/6735/bulk-write/347706122009/347706122009.zip"
    # destination_folder = "/Users/user_name/Documents"
    # """
    # Get instance of BulkWriteOperations Class
    bwo = BulkWrite::BulkWriteOperations.new
    # Call download_bulk_write_result method that takes download_url as parameter
    response = bwo.download_bulk_write_result(download_url)
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
        if response_handler.is_a? BulkWrite::FileBodyWrapper
          file_body_wrapper = response_handler
          # Get StreamWrapper instance from the returned FileBodyWrapper instance
          stream_wrapper = file_body_wrapper.file
          # Open the destination file where the file needs to be written in 'w' mode
          File.open(stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? BulkWrite::APIException
          exception = response_handler
          print response_handler.inspect
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
            print v
            print "\n"
          end

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
