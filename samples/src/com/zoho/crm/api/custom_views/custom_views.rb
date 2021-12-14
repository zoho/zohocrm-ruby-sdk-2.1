require 'ZOHOCRMSDK2_1'

class Custom_Views
  def self.get_custom_views(module_api_name)
    # """
    # This method is used to get the custom views data of a particular module.
    # Specify the module name in your API request whose custom view data you want to retrieve.
    # :param module_api_name: the API name of the required module.
    # """

    # """
    # example
    # module_api_name = "Leads";
    # """
    # Get instance of CustomViewOperations Class that takes module_api_name as parameter

    cvo = ZOHOCRMSDK::CustomViews::CustomViewsOperations.new(module_api_name)
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Call get_custom_views method
    response = cvo.get_custom_views(pm)
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
        if response_handler.is_a? ZOHOCRMSDK::CustomViews::ResponseWrapper
          # Get the list of obtained CustomView instances
          custom_views = response_handler.custom_views
          custom_views.each do |cv|
            # Get the DisplayValue of each CustomView
            print "\nCustomView DisplayValue: "
            print cv.display_value
            # Get the default value of each CustomView
            print "\nCustomView Default: "
            print cv.default
            # Get the System Name of each CustomView
            print "\nCustomView SystemName: "
            print cv.system_name
            # Get the AccessType of each CustomView
            print "\nCustomView AccessType: "
            print cv.access_type
            # Get the SystemDefined of each CustomView
            print "\nCustomView SystemDefined: "
            print cv.system_defined
            # Get the Name of each CustomView
            print "\nCustomView Name: "
            print cv.name
            # Get the ID of each CustomView
            print "\nCustomView ID: "
            print cv.id.to_s
            # Get the Category of each CustomView
            print "\nCustomView Category: "
            print cv.category
            # Get the Favorite of each CustomView
            unless cv.favorite.nil?
              print "\nCustomView Favorite: "
              print cv.favorite
            end
            # Get the created_by User instance of each Custom View
            created_by = cv.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n CustomView Created User-Name:"
              print created_by.name
              # Get the ID of the created_by User
              print "\n CustomView Created User-ID:"
              print created_by.id
            end

            # Get the modified by User instance of each Custom View
            modified_by = cv.modified_by
            # Check if modified_by is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n CustomView Modified User-Name:"
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n CustomView Modified User-ID:"
              print modified_by.id
            end
            # Get the ModifiedTime of each Custom View
            print "\nCustomView ModifiedTime: "
            print cv.modified_time
            # Get the LastAccessedTime of each Custom View
            print "\nCustomView LastAccessedTime: "
            print cv.last_accessed_time
          end
          info = response_handler.info

          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\nCustomView Info Per page: "
              print info.per_page
            end
            unless info.default.nil?
              print "\nCustomView Info default: "
              print info.default
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\nCustomView Info Count: "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\nCustomView Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\nCustomView Info more records: "
              print info.more_records
            end
            translation = info.translation
            unless translation.nil?
              # Get the PublicViews of the Translation
              print "\nCustomView Info Translation PublicViews:: "
              print translation.public_views
              # Get the OtherUsersViews of the Translation
              print "\nCustomView Info Translation: OtherUsersViews"
              print translation.other_users_views
              # Get the SharedWithMe of the Translation
              print "\nCustomView Info Translation: SharedWithMe"
              print translation.shared_with_me
              # Get the CreatedByMe of the Translation
              print "\nCustomView Info Translation: CreatedByMe"
              print translation.created_by_me
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::CustomViews::APIException
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

  def self.get_custom_view(module_api_name, custom_view_id)
    # """
    # This method is used to get the data of any specific custom view of the module with ID
    # :param module_api_name: The API name of the required module.
    # :param custom_view_id: ID of the CustomView to be obtained
    # :return:
    # """
    # Get instance of CustomViewOperations Class that takes module_api_name as parameter
    cvo = ZOHOCRMSDK::CustomViews::CustomViewsOperations.new(module_api_name)

    # Call get_custom_view method that takes custom_view_id as parameter
    response = cvo.get_custom_view(custom_view_id)
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
        if response_handler.is_a? ZOHOCRMSDK::CustomViews::ResponseWrapper
          # Get the list of obtained CustomView instances
          custom_views = response_handler.custom_views
          custom_views.each do |cv|
            # Get the DisplayValue of each CustomView
            print "\nCustomView DisplayValue: "
            print cv.display_value

            # Get the default value of each CustomView
            print "\nCustomView Default: "
            print cv.default
            # Get the System Name of each CustomView
            print "\nCustomView SystemName: "
            print cv.system_name
            # Get the AccessType of each CustomView
            print "\nCustomView AccessType: "
            print cv.access_type
            # Get the SystemDefined of each CustomView
            print "\nCustomView SystemDefined: "
            print cv.system_defined
            # Get the Name of each CustomView
            print "\nCustomView Name: "
            print cv.name
            # Get the ID of each CustomView
            print "\nCustomView ID: "
            print cv.id.to_s
            # Get the Category of each CustomView
            print "\nCustomView Category: "
            print cv.category
            # Get the Favorite of each CustomView
            unless cv.favorite.nil?
              print "\nCustomView Favorite: "
              print cv.favorite
            end
            criteria = cv.criteria
            print_criteria(criteria) unless criteria.nil?
            shared_to_details = cv.shared_to
            # Get the Name of the each SharedDetails
            # Get the ID of the each SharedDetails
            # Get the Type of the each SharedDetails
            # Get the Subordinates of the each SharedDetails
            shared_to_details&.each do |shared_to|
              # Get the Name of the each SharedTo
              print "\n SharedTo Name:"
              print shared_to.name
              # Get the ID of the each SharedTo
              print "\n SharedTo ID:"
              print shared_to.id.to_s
              # Get the Type of the each SharedTo
              print "\n SharedTo Type:"
              print shared_to.type
              # Get the Subordinates of the each SharedTo
              print "\n SharedTo Subordinated:"
              print shared_to.subordinates
            end
            # Get the SortOrder of each CustomView
            unless cv.sort_order.nil?
              print "\nCustomView Sort order: "
              print cv.sort_order
            end
            # Get the SortBy of each CustomView
            unless cv.sort_by.nil?
              print "\nCustomView Sort by: "
              print cv.sort_by
            end
            # Get the fields of each CustomView
            cv.fields&.each do |field|
              print "\n"
              print field
            end
            # Get the created_by User instance of each Custom View
            created_by = cv.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n CustomView Created User-Name:"
              print created_by.name
              # Get the ID of the created_by User
              print "\n CustomView Created User-ID:"
              print created_by.id
            end

            # Get the modified by User instance of each Custom View
            modified_by = cv.modified_by
            # Check if modified_by is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n CustomView Modified User-Name:"
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n CustomView Modified User-ID:"
              print modified_by.id
            end
            # Get the ModifiedTime of each Custom View
            print "\nCustomView ModifiedTime: "
            print cv.modified_time
            # Get the LastAccessedTime of each Custom View
            print "\nCustomView LastAccessedTime: "
            print cv.last_accessed_time
          end
          info = response_handler.info
          unless info.nil?
            translation = info.translation
            unless translation.nil?
              print "\nCustomView Info Translation PublicViews:: "
              print translation.public_views
              print "\nCustomView Info Translation: OtherUsersViews"
              print translation.other_users_views
              print "\nCustomView Info Translation: SharedWithMe"
              print translation.shared_with_me
              print "\nCustomView Info Translation: CreatedByMe"
              print translation.created_by_me
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::CustomViews::APIException
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
      print "\n CustomView Criteria Comparator:"
      print criteria.comparator.value
    end
    # Get the Value of the Criteria
    unless criteria.value.nil?
      print "\nCustomView Criteria Value::"
      print criteria.value
    end
    # Get the Field of the Criteria
    print "\n CustomView Criteria field:"
    print criteria.field&.api_name
    criteria_group = criteria.group
    # Get the List of Criteria instance of each Criteria
    criteria_group&.each do |criteria|
      print_criteria(criteria)
    end
    unless criteria.group_operator.nil?
      # Get the Group Operator of the Criteria
      print "\nCustomView Criteria Group Operator: "
      print criteria.group_operator.value
    end
  end
end
