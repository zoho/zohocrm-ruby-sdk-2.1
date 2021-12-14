require 'ZOHOCRMSDK2_1'

class Tag
  def self.get_tags(module_api_name)
    # """
    # This method is used to get all the tags in a module
    # :param module_api_name: The API Name of the module to get tags.
    # """

    # """
    # example
    # module_api_name = "Leads"
    # """
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of Get Tags operation
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::GetTagsParam.module_1, module_api_name)
    # Call get_tags method that takes ParameterMap instance as parameter
    response = to.get_tags(pm)
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
        if response_handler.is_a? ZOHOCRMSDK::Tags::ResponseWrapper
          # Get the list of obtained Tag instances
          tags = response_handler.tags
          tags.each do |tag|
            # Get the CreatedTime of each Tag
            print "\n Tag CreatedTime: "
            print tag.created_time
            # Get the ModifiedTime of each Tag
            print "\n Tag ModifiedTime: "
            print tag.modified_time
            print "\n Tag ColorCode:"
            print tag.color_code
            # Get the Name of each Tag
            print "\n Tag Name: "
            print tag.name
            # Get the modifiedBy User instance of each Tag
            modified_by = tag.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n Tag Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n Tag Modified By User-Id: "
              print modified_by.id.to_s
            end
            # Get the ID of each Tag
            print "\n Tag ID: "

            print tag.id.to_s
            # Get the createdBy User instance of each Tag
            created_by = tag.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the createdBy User
              print "\n Tag Created By User-Name: "
              print created_by.name
              # Get the ID of the createdBy User
              print "\n Tag Created By User-Id: "
              print created_by.id.to_s
            end
          end
          # Get the obtained Info object
          info = response_handler.info
          # Check if info is not None
          unless info.nil?
            unless info.allowed_count.nil?
              # Get the AllowedCount of the Info
              print "\n Tag Info AllowedCount: "
              print info.allowed_count
            end
            unless info.count.nil?
              # Get the Count of the Info
              print "\n Tag Info Count:  "
              print info.count
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Tags::APIException
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

  def self.create_tags(module_api_name)
    # """
    # This method is used to create new tags and print the response.
    # :param module_api_name: The API Name of the module to create tags.
    # """

    # """
    # example
    # module_api_name = "Leads"
    # """
    # List to hold Tag instances
    tags = []
    (3..4).each do |i|
      # Get instance of Tag Class
      tag = ZOHOCRMSDK::Tags::Tag.new
      # Set Name to tag
      tag.name = i.to_s
      # Add the Tag instance to list
      tags.push(tag)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Tags::BodyWrapper.new
    # Set the list to tags in BodyWrapper instance
    bw.tags = tags
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of Create Tags operation
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::CreateTagsParam.module_1, module_api_name)
    # Call create_tags method that takes BodyWrapper instance and ParameterMap instance as parameter
    response = to.create_tags(bw,pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.tags
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.update_tags(module_api_name)
    # """
    # This method is used to update multiple tags simultaneously and print the response.
    # :param module_api_name: The API Name of the module to update tags
    # """

    # """
    # example
    # module_api_name = "Leads"
    # """
    # List to hold Tag instances
    tags = []
    tags_id = [347706111405001, 347706110329006]
    for i in 0..1
      # Get instance of Tag Class
      tag = ZOHOCRMSDK::Tags::Tag.new
      #Set ID
      tag.id = tags_id[i]
      #Set name
      tag.name = tags_id[i].to_s
      # Add the instance to list
      tags.push(tag)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Tags::BodyWrapper.new
    # Set the list to tags in BodyWrapper instance
    bw.tags = tags
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of Update Tags operation
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::UpdateTagsParam.module_1, module_api_name)
    # Call update_tags method that takes BodyWrapper instance and ParameterMap instance as parameter
    response = to.update_tags(bw,pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.tags
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.update_tag(module_api_name, tag_id)
    # """
    # This method is used to update single tag and print the response.
    # :param module_api_name: The API Name of the module to update tag.
    # :param tag_id: The ID of the tag to be updated
    # """

    # """
    # example
    # module_api_name = "Leads"
    # tag_id = '34096430661047'
    # """
    # List to hold Tag instances
    tags = []
    for i in 0..0
      # Get instance of Tag Class
      tag = ZOHOCRMSDK::Tags::Tag.new
      #Set name
      tag.name = 'sd'
      # Add the instance to list
      tags.push(tag)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::Tags::BodyWrapper.new
    # Set the list to tags in BodyWrapper instance
    bw.tags = tags
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of Update Tag operation
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::UpdateTagParam.module_1, module_api_name)
    # Call update_tag method that takes BodyWrapper instance, ParameterMap instance and tag_id as parameter
    response = to.update_tag(tag_id, bw,pm )
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.tags
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.delete_tag(tag_id)
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Call delete_tag method that takes tag_id as parameter
    response = to.delete_tag(tag_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.tags
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.merge_tags(tag_id, conflict_id)
    # """
    # This method is used to merge tags and put all the records under the two tags into a single tag and print the response.
    # :param tag_id: The ID of the tag
    # :param conflict_id: The ID of the conflict tag.
    # """

    # """
    # example
    # tag_id = 34096430661047
    # conflict_id = 34096430661026
    # """
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Array to hold ConflictWrapper instances
    tags = []
    # Get instance of ConflictWrapper Class
    merge_tag = ZOHOCRMSDK::Tags::ConflictWrapper.new
    # Set the conflict ID
    merge_tag.conflict_id = conflict_id
    # Add the instance to list
    tags.push(merge_tag)
    # Get instance of MergeWrapper Class that will contain the request body
    mw = ZOHOCRMSDK::Tags::MergeWrapper.new
    # Set the list to tags in BodyWrapper instance
    mw.tags = tags
    # Call merge_tags method that takes MergeWrapper instance and tag_id as parameter
    response = to.merge_tags(tag_id,mw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.tags
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.add_tags_to_record(module_api_name, record_id, tag_names)
    # """
    # This method is used to add tags to a specific record and print the response.
    # :param module_api_name: The API Name of the module to add tag.
    # :param record_id: The ID of the record to add tag
    # :param tag_names: The list of tag names
    # """

    # """
    # example
    # module_api_name = "Leads"
    # record_id = 34096432157023
    # tag_names = ["addtag1,addtag12"]
    # """
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of Add Tags to record operation
    tag_names.each do |tag_name|
      pm.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsToRecordParam.tag_names, tag_name)
    end
    # pm.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsToRecordParam.over_write,"false")
    # Call add_tags_to_record method that takes ParameterMap instance, module_api_name and record_id as parameter
    response = to.add_tags_to_record(record_id, module_api_name, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected RecordActionWrapper instance is received.
        # Check if expected RecordActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::RecordActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.remove_tags_from_record(module_api_name, record_id, tag_names)
    # """
    # This method is used to delete the tags associated with a specific record and print the response.
    # :param module_api_name: The API Name of the module to remove tags
    # :param record_id: The ID of the record to delete tags
    # :param tag_names: The list of the tag names to be removed.
    # :return:
    # """

    # """
    # example
    # module_api_name = "Leads"
    # record_id = 34096432157023
    # tag_names = ["addtag1,addtag12"]
    # """

    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of remove Tags to record  operation
    tag_names.each do |tag_name|
      pm.add(ZOHOCRMSDK::Tags::TagsOperations::RemoveTagsFromRecordParam.tag_names, tag_name)
    end
    # pm.add(ZOHOCRMSDK::Tags::TagsOperations::RemoveTagsFromRecordParam.over_write,"false")
    # Call remove_tags_from_record method that takes ParameterMap instance and module_api_name as parameter
    response = to.remove_tags_from_record(record_id, module_api_name, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected RecordActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::RecordActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.add_tags_to_multiple_records(module_api_name, record_ids, tag_names)
    # """
    # This method is used to add tags to multiple records simultaneously and print the response.
    # :param module_api_name: The API Name of the module to add tags.
    # :param record_ids: The list of the record IDs to add tags
    # :param tag_names: The list of tag names to be added
    # """
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters for Add Tags To Multiple Records operation
    tag_names.each do |tag_name|
      pm.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsToMultipleRecordsParam.tag_names, tag_name)
    end
    record_ids.each do |record_id|
      pm.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsToMultipleRecordsParam.ids, record_id)
    end
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsToRecordParam.over_write, 'true')
    # Call add_tags_to_multiple_records method that takes ParameterMap instance and module_api_name as parameter
    response = to.add_tags_to_multiple_records(module_api_name,pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected RecordActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::RecordActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
          # Get the Locked Count
          if action_wrapper.locked_count.nil?
            print "\n Locked Count: "
            print action_wrapper.locked_count
          end
          # Get the Success Count
          if action_wrapper.success_count.nil?
            print "\n Success Count: "
            print action_wrapper.success_count
          end
          # Get the WF Scheduler Count
          if action_wrapper.wf_scheduler.nil?
            print "\n WF Scheduler: "
            print action_wrapper.wf_scheduler
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.remove_tags_from_multiple_records(module_api_name, record_ids, tag_names)
    # """
    # This method is used to delete the tags associated with multiple records and print the response.
    # :param module_api_name: The API Name of the module to remove tags.
    # :param record_ids: The list of record IDs to remove tags.
    # :param tag_names: The list of tag names to be removed
    # """

    # """
    # example
    # module_api_name = "Leads"
    # record_ids = ['34096432157023', '34096432157025', '34096432157020']
    # tag_names = ["addtag1,addtag12"]
    # """
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of remove Tags from records operation
    tag_names.each do |tag_name|
      pm.add(ZOHOCRMSDK::Tags::TagsOperations::RemoveTagsFromMultipleRecordsParam.tag_names, tag_name)
    end
    record_ids.each do |record_id|
      pm.add(ZOHOCRMSDK::Tags::TagsOperations::RemoveTagsFromMultipleRecordsParam.ids, record_id)
    end
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::AddTagsToRecordParam.over_write, 'false')
    # Call remove_tags_from_multiple_records method that takes ParameterMap instance, module_api_name as parameters
    response = to.remove_tags_from_multiple_records(module_api_name,pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected RecordActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Tags::RecordActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Tags::SuccessResponse
              success_response = action_response
              # Get the Code
              print 'code:'
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
            elsif action_response.is_a? ZOHOCRMSDK::Tags::APIException
              api_exception = action_response
              # Get the Code
              print 'code:'
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
          end
          # Get the Locked Count
          if action_wrapper.locked_count.nil?
            print "\n Locked Count: "
            print action_wrapper.locked_count
          end
          # Get the Success Count
          if action_wrapper.success_count.nil?
            print "\n Success Count: "
            print action_wrapper.success_count
          end
          # Get the WF Scheduler Count
          if action_wrapper.wf_scheduler.nil?
            print "\n WF Scheduler: "
            print action_wrapper.wf_scheduler
          end
        # Check if the request returned an exception
        elsif action_handler.is_a? ZOHOCRMSDK::Tags::APIException
          exception = action_handler
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

  def self.get_record_count_for_tag(module_api_name, tag_id)
    # """
    # This method is used to get the total number of records under a tag and print the response.
    # :param module_api_name: The API Name of the module.
    # :param tag_id: The ID of the tag to get the count
    # """

    # """
    # example
    # module_api_name = "Leads"
    # tag_id = "34096430661047";
    # """
    # Get instance of TagsOperations Class
    to = ZOHOCRMSDK::Tags::TagsOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters of get record count for Tags operation
    # Possible parameters for Get Record Count operation
    pm.add(ZOHOCRMSDK::Tags::TagsOperations::GetRecordCountForTagParam.module_1, module_api_name)
    # Call get_record_count_for_tag method that takes param_instance and tag_id as parameter
    response = to.get_record_count_for_tag(tag_id,pm)
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
        # Check if expected CountWrapper instance is received.
        if response_handler.is_a? ZOHOCRMSDK::Tags::CountWrapper
          counter_wrapper = response_handler
          # Get the obtained tag count
          print "\n Tag Count: "
          print counter_wrapper.count
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Tags::APIException
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
