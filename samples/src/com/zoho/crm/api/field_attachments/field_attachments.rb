require 'ZCRMSDK'

class Field_Attachments
  def self.get_field_attachments(module_api_name,record_id,attachment_id,destination_folder)
    # """
    # This method is used to download the file with ID and write in the destinationFolder
    # :param attachment_id: The ID of the attachment.
    # :param destination_folder: The absolute path of the destination folder to store the File
    # :param module_api_name The module name of the Module
    # :param record_id The record Id of the record
    # """

    # """
    # example
    # id = "ae9c7cefa418aec1d6a5cc2d9ab35c3231aae3bfeef7d5e00a54b7563c0dd42b";
    # destination_folder = "/Users/test/Desktop"
    # """
    # Get instance of FieldAttachmentsOperations Class
    fo = FieldAttachments::FieldAttachmentsOperations.new(module_api_name, record_id, attachment_id)

    # Call get_field_attachments method 
    response = fo.get_field_attachments()
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
        if response_handler.is_a? FieldAttachments::FileBodyWrapper
          # Get StreamWrapper instance from the returned FileBodyWrapper instance
          file_body_wrapper = response_handler
          stream_wrapper = file_body_wrapper.file
          # Construct the file name by joining the destinationFolder and the name from StreamWrapper instance
          # Open the destination file where the file needs to be written in 'w' mode
          File.open(destination_folder + '/' + stream_wrapper.name, 'w') do |f|
            f.write(stream_wrapper.stream)
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? FieldAttachments::APIException
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
end
