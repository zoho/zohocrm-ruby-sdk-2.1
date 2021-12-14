require 'ZOHOCRMSDK2_1'

class User
  def self.get_users
    # """
    # This method is used to retrieve the users data specified in the API request.
    # """
    # Get instance of UsersOperations Class
    uo = ZOHOCRMSDK::Users::UsersOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters for Get Users operation
    pm.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersParam.type, 'ActiveUsers')
    pm.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersParam.page, 1)
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # Possible headers for Get Users operation
    # hm.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersHeader.If_modified_since,"")
    # Call get_users method that takes ParameterMap instance and HeaderMap instance as parameters

    response = uo.get_users(pm, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::Users::ResponseWrapper
          # Get the list of obtained User instances
          users = response_handler.users
          users.each do |user|
            # Get the Country of each User
            print "\n User Country: "
            print user.country
            # Check if customizeInfo is not None
            # Get the CustomizeInfo instance of each User
            customize_info = user.customize_info
            unless customize_info.nil?
              unless customize_info.notes_desc.nil?
                # Get the NotesDesc of each User
                print "\n User CustomizeInfo NotesDesc:"
                print customize_info.notes_desc
              end
              unless customize_info.show_right_panel.nil?
                # Get the ShowRightPanel of each User
                print "\n User CustomizeInfo ShowRightPanel:"
                print customize_info.show_right_panel
              end
              unless customize_info.bc_view.nil?
                # Get the BcView of each User
                print "\n User CustomizeInfo BcView:"
                print customize_info.bc_view
              end
              unless customize_info.show_home.nil?
                # Get the ShowHome of each User
                print "\n User CustomizeInfo ShowHome:"
                print customize_info.show_home
              end
              unless customize_info.show_detail_view.nil?
                # Get the ShowDetailView of each User
                print "\n User CustomizeInfo ShowDetailView:"
                print customize_info.show_detail_view
              end
              unless customize_info.unpin_recent_item.nil?
                # Get the UnpinRecentItem of each User
                print "\n User CustomizeInfo UnpinRecentItem:"
                print customize_info.unpin_recent_item
              end
            end
            # Get the Role instance of each User
            role = user.role
            unless role.nil?
              # Get the Name of Role
              print "\n User Role Name: "
              print role.name
              # Get the ID of Role
              print "\n User Role ID: "
              print role.id.to_s
            end
            # Get the Signature of each User
            print "\n User Signature: "
            print user.signature
            # Get the SortOrderPreference of each User
            print "\n User SortOrderPreference: "
            print user.sort_order_preference
            # Get the SandboxDeveloper of each User
            print "\n User SandboxDeveloper: "
            print user.sandboxdeveloper
            # Get the City of each User
            print "\n User City: "
            print user.city
            # Get the NameFormat of each User
            print "\n User NameFormat: "
            print user.name_format
            # Get the Language of each User
            print "\n User Language: "
            print user.language
            # Get the Locale of each User
            print "\n User Locale: "
            print user.locale
            # Get the Microsoft of each User
            print "\n User Microsoft: "
            print user.microsoft
            unless user.personal_account.nil?
              # Get the PersonalAccount of each User
              print "\n User PersonalAccount: "
              print user.personal_account
            end
            # Get the DefaultTabGroup of each User
            print "\n User DefaultTabGroup: "
            print user.default_tab_group
            # Get the Isonline of each User
            print "\n User Isonline: "
            print user.isonline
            # Get the modifiedBy User instance of each User
            modified_by = user.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n User Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n User Modified By User-Id: "
              print modified_by.id.to_s
            end
            # Get the Street of each User
            print "\n User Street: "
            print user.street
            # Get the Currency of each User
            print "\n User Currency: "
            print user.currency
            # Get the Alias of each User
            print "\n User Alias: "
            print user.alias
            # Get the Theme instance of each User
            theme = user.theme
            # Check if theme is not None
            unless theme.nil?
              # Get the TabTheme instance of Theme
              normal_tab = theme.normal_tab
              # Check if normal_tab is not null
              unless normal_tab.nil?
                # Get the FontColor of NormalTab
                print "\n User Theme NormalTab FontColor: "
                print normal_tab.font_color
                # Get the Background of NormalTab
                print "\n User Theme NormalTab Name:"
                print normal_tab.background
              end
              # Get the TabTheme instance of Theme
              selected_tab = theme.selected_tab
              # Check if selected_tab is not null
              unless selected_tab.nil?
                # Get the FontColor of selected_tab
                print "\n User Theme selected_tab FontColor: "
                print selected_tab.font_color
                # Get the Background of selected_tab
                print "\n User Theme selected_tab Name:"
                print selected_tab.background
              end
              # Get the NewBackground of each Theme
              print "\n User Theme NewBackground: "
              # Get the Background of each Theme
              print theme.new_background
              print "\n User Theme Background: "
              print theme.background
              # Get the Screen of each Theme
              print "\n User Theme Background: "
              print theme.screen
              # Get the Type of each Theme
              print "\n User Theme Type: "
              print theme.type
            end
            # Get the ID of each User
            print "\n User ID: "
            print user.id.to_s
            # Get the State of each User
            print "\n User State: "
            print user.state
            # Get the Fax of each User
            print "\n User Fax: "
            print user.fax
            # Get the CountryLocale of each User
            print "\n User CountryLocale: "
            print user.country_locale
            # Get the FirstName of each User
            print "\n User FirstName: "
            print user.first_name
            # Get the Email of each User
            print "\n User Email: "
            print user.email
            # Get the reportingTo User instance of each User
            reporting_to = user.reporting_to
            # Check if reporting_to is not None
            unless reporting_to.nil?
              # Get the Name of the reporting_to User
              print "\n User ReportingTo User-Name: "
              print reporting_to.name
              # Get the ID of the reporting_to User
              print "\n User ReportingTo User-Id: "
              print reporting_to.id.to_s
            end
            # Get the DecimalSeparator of each User
            print "\n User DecimalSeparator: "
            print user.decimal_separator
            # Get the Zip of each User
            print "\n User Zip: "
            print user.zip
            # Get the LastName of each User
            print "\n User LastName: "
            print user.last_name
            # Get the CreatedTime of each User
            print "\n User CreatedTime: "
            print user.created_time
            # Get the Website of each User
            print "\n User Website: "
            print user.website
            # Get the ModifiedTime of each User
            print "\n User ModifiedTime: "
            print user.modified_time
            # Get the TimeFormat of each User
            print "\n User TimeFormat: "
            print user.time_format
            # Get the Offset of each User
            print "\n User Offset: "
            print user.offset
            # Get the Profile instance of each User
            profile = user.profile
            # Check if profile is not None
            unless profile.nil?
              # Get the Name of the profile
              print "\n User Profile Name: "
              print profile.name
              # Get the ID of the profile
              print "\n User Profile ID: "
              print profile.id.to_s
            end
            # Get the Zuid of each User
            print "\n User Zuid: "
            print user.zuid
            # Get the Confirm of each User
            print "\n User Confirm: "
            print user.confirm
            # Get the FullName of each User
            print "\n User FullName: "
            print user.full_name
            # Get the list of obtained Territory instances
            territories = user.territories
            # Check if territories is not None
            # Get the Manager of the Territory
            # Get the Name of the Territory
            # Get the ID of the Territory
            territories&.each do |territory|
              # Get the Manager of the Territory
              print "\n User Territory Manager: "
              print territory.manager
              # Get the Name of the Territory
              print "\n User Territory name: "
              print territory.name
              # Get the ID of the Territory
              print "\n User Territory id: "
              print territory.id.to_s
            end
            # Get the Phone of each User
            print "\n User Phone: "
            print user.phone
            # Get the Mobile of each User
            print "\n User Mobile: "
            print user.mobile
            # Get the DOB of each User
            print "\n User DOB: "
            print user.dob
            # Get the DateFormat of each User
            print "\n User DateFormat: "
            print user.date_format
            # Get the Status of each User
            print "\n User Status: "
            print user.status
          end
          # Get the obtained Info object
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n User Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n User Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n User Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n User Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Users::APIException
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

  def self.create_user
    # """
    # This method is used to add a user to your organization and print the response.
    # """
    users = []
    # Get instance of Role Class
    role = ZOHOCRMSDK::Roles::Role.new
    # Set ID to Role instance
    role.id = 34770610026008
    # Set profile instance to profile in User instance
    profile = ZOHOCRMSDK::Profiles::Profile.new
    profile.id = 34770610026014
    # Get instance of User Class
    user = ZOHOCRMSDK::Users::User.new
    # Get instance of Profile Class
    user.profile = profile
    # Set role instance to role in User
    user.role = role
    user.first_name = '1'
    user.last_name = '1'
    user.email = 'abc@zoho.com'
    # Set the list to users in BodyWrapper instance
    users.push(user)
    # Get instance of RequestWrapper Class that will contain the request body
    rw = ZOHOCRMSDK::Users::RequestWrapper.new
    # List to hold User instances
    rw.users = users
    # Get instance of UsersOperations Class
    uo = ZOHOCRMSDK::Users::UsersOperations.new
    response = uo.create_user(rw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.users
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Users::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Users::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Users::APIException
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

  def self.update_users
    # """
    # This method is used to update the details of multiple users of your organization and print the response.
    # """
    users = []
    user_id = 347706110331010
    # Get instance of Role Class
    role = ZOHOCRMSDK::Roles::Role.new
    # Set ID to Role instance
    role.id = 34770610026008
    # Get instance of Profile Class
    profile = ZOHOCRMSDK::Profiles::Profile.new
    # Set ID to Profile instance
    profile.id = 34770610026014
    # Get instance of User Class
    user = ZOHOCRMSDK::Users::User.new
    # set instance of Profile Class to User
    user.profile = profile
    # set instance of Role Class to User
    user.role = role
    user.first_name = '1'
    # Set ID to User instance
    user.id = user_id
    user.last_name = '1'
    user.email = '1@zoho.com'
    users.push(user)
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::Users::BodyWrapper.new
    # Set the list to users in BodyWrapper
    body_wrapper.users = users
    # Get instance of UsersOperations Class
    uo = ZOHOCRMSDK::Users::UsersOperations.new
    # Call update_users method that takes BodyWrapper instance as parameter
    response = uo.update_users(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.users
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Users::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Users::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Users::APIException
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

  def self.get_user(user_id)
    # """
    # This method is used to get the details of any specific user with ID
    # :param user_id: The ID of the User to be obtained
    # """

    # """
    # example
    # user_id = 34096430302031
    # """
    # Get instance of UsersOperations Class
    uo = ZOHOCRMSDK::Users::UsersOperations.new
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # hm.add(ZOHOCRMSDK::Users::UsersOperations::GetUsersHeader.If_modified_since,"")
    # Call get_user method that takes HeaderMap instance and user_id as parameters
    response = uo.get_user(user_id,hm)
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
        if response_handler.is_a? ZOHOCRMSDK::Users::ResponseWrapper
          # Get the list of obtained User instances
          users = response_handler.users
          users.each do |user|
            # Get the Country of each User
            print "\n User Country: "
            print user.country
            # Check if customizeInfo is not None
            # Get the CustomizeInfo instance of each User
            customize_info = user.customize_info
            unless customize_info.nil?
              unless customize_info.notes_desc.nil?
                # Get the NotesDesc of each User
                print "\n User CustomizeInfo NotesDesc:"
                print customize_info.notes_desc
              end
              unless customize_info.show_right_panel.nil?
                # Get the ShowRightPanel of each User
                print "\n User CustomizeInfo ShowRightPanel:"
                print customize_info.show_right_panel
              end
              unless customize_info.bc_view.nil?
                # Get the BcView of each User
                print "\n User CustomizeInfo BcView:"
                print customize_info.bc_view
              end
              unless customize_info.show_home.nil?
                # Get the ShowHome of each User
                print "\n User CustomizeInfo ShowHome:"
                print customize_info.show_home
              end
              unless customize_info.show_detail_view.nil?
                # Get the ShowDetailView of each User
                print "\n User CustomizeInfo ShowDetailView:"
                print customize_info.show_detail_view
              end
              unless customize_info.unpin_recent_item.nil?
                # Get the UnpinRecentItem of each User
                print "\n User CustomizeInfo UnpinRecentItem:"
                print customize_info.unpin_recent_item
              end
            end
            # Get the Role instance of each User
            role = user.role
            unless role.nil?
              # Get the Name of Role
              print "\n User Role Name: "
              print role.name
              # Get the ID of Role
              print "\n User Role ID: "
              print role.id.to_s
            end
            # Get the Signature of each User
            print "\n User Signature: "
            print user.signature
            # Get the City of each User
            print "\n User City: "
            print user.city
            # Get the NameFormat of each User
            print "\n User NameFormat: "
            print user.name_format
            # Get the Language of each User
            print "\n User Language: "
            print user.language
            # Get the Locale of each User
            print "\n User Locale: "
            print user.locale
            # Get the Microsoft of each User
            print "\n User Microsoft: "
            print user.microsoft
            unless user.personal_account.nil?
              # Get the PersonalAccount of each User
              print "\n User PersonalAccount: "
              print user.personal_account
            end
            # Get the DefaultTabGroup of each User
            print "\n User DefaultTabGroup: "
            print user.default_tab_group
            # Get the Isonline of each User
            print "\n User Isonline: "
            print user.isonline
            # Get the modifiedBy User instance of each User
            modified_by = user.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n User Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n User Modified By User-Id: "
              print modified_by.id.to_s
            end
            # Get the Street of each User
            print "\n User Street: "
            print user.street
            # Get the Currency of each User
            print "\n User Currency: "
            print user.currency
            # Get the Alias of each User
            print "\n User Alias: "
            print user.alias
            # Get the Theme instance of each User
            theme = user.theme
            # Check if theme is not None
            unless theme.nil?
              # Get the TabTheme instance of Theme
              normal_tab = theme.normal_tab
              # Check if normal_tab is not null
              unless normal_tab.nil?
                # Get the FontColor of NormalTab
                print "\n User Theme NormalTab FontColor: "
                print normal_tab.font_color
                # Get the Background of NormalTab
                print "\n User Theme NormalTab Name:"
                print normal_tab.background
              end
              # Get the TabTheme instance of Theme
              selected_tab = theme.selected_tab
              # Check if selected_tab is not null
              unless selected_tab.nil?
                # Get the FontColor of selected_tab
                print "\n User Theme selected_tab FontColor: "
                print selected_tab.font_color
                # Get the Background of selected_tab
                print "\n User Theme selected_tab Name:"
                print selected_tab.background
              end
              # Get the NewBackground of each Theme
              print "\n User Theme NewBackground: "
              # Get the Background of each Theme
              print theme.new_background
              print "\n User Theme Background: "
              print theme.background
              # Get the Screen of each Theme
              print "\n User Theme Background: "
              print theme.screen
              # Get the Type of each Theme
              print "\n User Theme Type: "
              print theme.type
            end
            # Get the ID of each User
            print "\n User ID: "
            print user.id.to_s
            # Get the State of each User
            print "\n User State: "
            print user.state
            # Get the Fax of each User
            print "\n User Fax: "
            print user.fax
            # Get the CountryLocale of each User
            print "\n User CountryLocale: "
            print user.country_locale
            # Get the FirstName of each User
            print "\n User FirstName: "
            print user.first_name
            # Get the Email of each User
            print "\n User Email: "
            print user.email
            # Get the reportingTo User instance of each User
            reporting_to = user.reporting_to
            # Check if reporting_to is not None
            unless reporting_to.nil?
              # Get the Name of the reporting_to User
              print "\n User ReportingTo User-Name: "
              print reporting_to.name
              # Get the ID of the reporting_to User
              print "\n User ReportingTo User-Id: "
              print reporting_to.id.to_s
            end
            # Get the DecimalSeparator of each User
            print "\n User DecimalSeparator: "
            print user.decimal_separator
            # Get the Zip of each User
            print "\n User Zip: "
            print user.zip
            # Get the SortOrderPreference of each User
            print "\n User SortOrderPreference: "
            print user.sort_order_preference
            # Get the SandboxDeveloper of each User
            print "\n User SandboxDeveloper: "
            print user.sandboxdeveloper
            # Get the LastName of each User
            print "\n User LastName: "
            print user.last_name
            # Get the CreatedTime of each User
            print "\n User CreatedTime: "
            print user.created_time
            # Get the Website of each User
            print "\n User Website: "
            print user.website
            # Get the ModifiedTime of each User
            print "\n User ModifiedTime: "
            print user.modified_time
            # Get the TimeFormat of each User
            print "\n User TimeFormat: "
            print user.time_format
            # Get the Offset of each User
            print "\n User Offset: "
            print user.offset
            # Get the Profile instance of each User
            profile = user.profile
            # Check if profile is not None
            unless profile.nil?
              # Get the Name of the profile
              print "\n User Profile Name: "
              print profile.name
              # Get the ID of the profile
              print "\n User Profile ID: "
              print profile.id.to_s
            end
            # Get the Zuid of each User
            print "\n User Zuid: "
            print user.zuid
            # Get the Confirm of each User
            print "\n User Confirm: "
            print user.confirm
            # Get the FullName of each User
            print "\n User FullName: "
            print user.full_name
            # Get the list of obtained Territory instances
            territories = user.territories
            # Check if territories is not None
            # Get the Manager of the Territory
            # Get the Name of the Territory
            # Get the ID of the Territory
            territories&.each do |territory|
              # Get the Manager of the Territory
              print "\n User Territory Manager: "
              print territory.manager
              # Get the Name of the Territory
              print "\n User Territory name: "
              print territory.name
              # Get the ID of the Territory
              print "\n User Territory id: "
              print territory.id.to_s
            end
            # Get the Phone of each User
            print "\n User Phone: "
            print user.phone
            # Get the Mobile of each User
            print "\n User Mobile: "
            print user.mobile
            # Get the DOB of each User
            print "\n User DOB: "
            print user.dob
            # Get the DateFormat of each User
            print "\n User DateFormat: "
            print user.date_format
            # Get the Status of each User
            print "\n User Status: "
            print user.status
          end
          # Get the obtained Info object
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n User Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n User Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n User Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n User Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Users::APIException
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

  def self.update_user(user_id)
    # """
    # This method is used to update the details of any specific user with ID
    # :param user_id: The ID of the User to be updated
    # """

    # """
    # example
    # user_id = 34096430302031
    # """
    users = []
    # Get instance of Role Class
    role = ZOHOCRMSDK::Roles::Role.new
    # Set ID to Role instance
    role.id = 3_524_033___026_005
    # Get instance of Profile Class
    profile = ZOHOCRMSDK::Profiles::Profile.new
    # Set ID to Profile instance
    profile.id = 3_524_033___026_011
    # Get instance of User Class
    user = ZOHOCRMSDK::Users::User.new
    # set instance of Profile Class to User
    user.profile = profile
    # set instance of Role Class to User
    user.role = role
    user.first_name = '1'
    # Set ID to User instance
    user.last_name = '1'
    user.email = '1@zoho.com'
    users.push(user)
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::Users::BodyWrapper.new
    # Set the list to users in BodyWrapper
    body_wrapper.users = users
    # Get instance of UsersOperations Class
    uo = ZOHOCRMSDK::Users::UsersOperations.new
    # Call update_user method that takes BodyWrapper instance and user_id as parameters
    response = uo.update_user(user_id,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.users
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Users::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Users::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Users::APIException
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

  def self.delete_user(user_id)
    # """
    # This method is used to delete a user from your organization and print the response.
    # :param user_id: The ID of the User to be deleted
    # """

    # """
    # example
    # user_id = 34096430302031
    # """
    # Get instance of UsersOperations Class
    uo = ZOHOCRMSDK::Users::UsersOperations.new
    # Call delete_user method that takes user_id as parameter

    response = uo.delete_user(user_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Users::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.users
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Users::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Users::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Users::APIException
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
end
