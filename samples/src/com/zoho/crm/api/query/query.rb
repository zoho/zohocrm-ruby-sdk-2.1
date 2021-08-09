require 'ZCRMSDK'

class Queries
  def self.get_records
    # """
    # This method is used to get records from the module through a COQL query.
    # """
    # Get instance of QueryOperations Class
    qo = Query::QueryOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Query::BodyWrapper.new
    select_query = 'select Last_Name from Leads where Last_Name is not null limit 5'
    bw.select_query = select_query
    # Call get_records method that takes BodyWrapper instance as parameter
    response = qo.get_records(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? Query::ResponseWrapper
          # Get the list of obtained Record instances
          records = response_handler.data
          records.each do |record|
            # Get the ID of each Record
            print "\nRecordID: "
            print record.id.to_s
            # Get the createdBy User instance of each Record
            created_by = record.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\nRecord Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\nRecord Created By User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\nRecord Created By User-Email: "
              print created_by.email
            end
            # Get the CreatedTime of each Record
            print "\nRecord CreatedTime: "
            print record.created_time
            modified_by = record.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the Modified User
              print "\nRecord Modified By User-Name: "
              print modified_by.name
              # Get the ID of the Modified User
              print "\nRecord Modified By User-Id: "
              print modified_by.id.to_s
              # Get the Email of the Modified User
              print "\nRecord Modified By User-Email: "
              print modified_by.email
            end
            # Get the ModifiedTime of each Record
            print "\nRecord ModifiedTime: "
            print record.modified_time
            # Get the Field Value of each Record
            print "\nRecord Field Value: "
            print record.get_key_value('Last_Name')
            print "\nRecord KeyValues:"
            record.get_key_values.each do |key_name, value|
              if value.is_a? Array
                data_list = value
                data_list.each do |data|
                  if data.is_a? Hash
                    print "\n Record KeyName : " + key_name + '-Value : '
                    data.each do |k, v|
                      print "\n" + k + ':' + v
                    end
                  else
                    print data
                  end
                end
              elsif value.is_a? Hash
                print "\n Record KeyName : " + key_name + '-Value : '
                data.each do |k, v|
                  print "\n" + k + ':' + v
                end
              else
                print "\n "
                print key_name
                print value
              end
            end
          end
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n RelatedRecord Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n RelatedRecord Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n RelatedRecord Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n RelatedRecord Info more records: "
              print info.more_records
            end
          end
        elsif response_handler.is_a? Query::APIException
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
