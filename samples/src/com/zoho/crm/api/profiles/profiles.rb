require 'ZOHOCRMSDK2_1'

class Profile
  def self.get_profiles
    # """
    # This method is used to retrieve the profiles data through an API request and print the response.
    # """
    # Get instance of ProfilesOperations Class
    po = ZOHOCRMSDK::Profiles::ProfilesOperations.new(DateTime.new(2018, 8, 10, 4, 11, 9, '+03:00'))
    # Call get_profiles method
    response = po.get_profiles
    status_code = response.status_code
    print "\n Status Code :" + status_code.to_s
    if [204, 304].include? status_code
      print(status_code == 204 ? 'No Content' : 'Not Modified')
      return
    end
    # Check if expected instance is received.
    if response.is_expected
      response_handler = response.data_object
      # Check if expected ResponseWrapper instance is received
      if response_handler.is_a? ZOHOCRMSDK::Profiles::ResponseWrapper
        # Get the list of obtained Profile instances
        profiles = response_handler.profiles
        profiles.each do |profile|
          # Get the DisplayLabel of the each Profile
          print "\n Profile DisplayLabel:"
          print profile.display_label
          unless profile.created_time.nil?
            # Get the CreatedTime of each Profile
            print "\n Profile CreatedTime:"
            print profile.created_time
          end
          unless profile.modified_time.nil?
            # Get the ModifiedTime of each Profile
            print "\n Profile ModifiedTime:"
            print profile.modified_time
          end
          # Get the Name of the each Profile
          print "\n Profile Name:"
          print profile.name
          # Get the Created User instance of each Profile
          created_by = profile.created_by
          # Check if created_by is not None
          unless created_by.nil?
            # Get the Name of the Created User
            print "\n Profile Created By User-Name:"
            print created_by.name
            # Get the ID of the Created User
            print "\n Profile Created By User-ID:"
            print created_by.id.to_s
          end
          defaultview = profile.defaultview
          if !defaultview.nil?
            #Get the Name of the default view
            print "Default view Name : "
            print  defaultview.name
            #Get the id of the default view
            print "Default view id : " 
            print defaultview.id
            #Get the type of the default view
            print "Default view type : " 
            print defaultview.type
          end
          #check if custom profile
          print "is custom profile?  " 
          print profile.custom
          #check if deleted profile
          print "is deleted profile?  " 
          print profile.delete
          #get  permission type profile
          print "permission type   " 
          print profile.permission_type;
          # Get the modifiedBy User instance of each Profile
          modified_by = profile.modified_by
          # Check if modifiedBy is not None
          unless modified_by.nil?
            # Get the Name of the modifiedBy User
            print "\n Profile Modified User-Name:"
            print modified_by.id.to_s
            # Get the ID of the modifiedBy User
            print "\n Profile Modified User-ID:"
            print modified_by.name
          end
          # Get the Description of the each Profile
          print "\n Profile Description:"
          print profile.description
          # Get the ID of the each Profile
          print "\n Profile ID:"
          print profile.id.to_s

        end
      # Check if the request returned an exception
      elsif response_handler.is_a? ZOHOCRMSDK::Profiles::APIException
        exception = response_handler
        # Get the Code
        print 'code:'
        print exception.code.value
        # Get the Status
        print "\n status:"
        print exception.status.value
        # Get the details map
        exception.details.each do |k, v|
          print "\n"
          print k
          print v
          print "\n"
        end
        # Get the Message
        print "\n message:"
        print exception.message.value
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

  def self.get_profile(profile_id)
    # """
    # This method is used to get the details of any specific profile with ID.
    # :param profile_id: The ID of the Profile to be obtained
    # """
    # Get instance of ProfilesOperations Class
    po = ZOHOCRMSDK::Profiles::ProfilesOperations.new(DateTime.new(2018, 8, 10, 4, 11, 9, '+03:00'))
    # Call get_profile method that takes profile_id as parameter
    response = po.get_profile(profile_id)
    # Get the status code from response
    status_code = response.status_code
    print "\n Status Code :" + status_code.to_s
    if [204, 304].include? status_code
      print(status_code == 204 ? 'No Content' : 'Not Modified')
      return
    end
    # Check if expected instance is received.
    if response.is_expected
      response_handler = response.data_object
      # Check if expected ResponseWrapper instance is received
      if response_handler.is_a? ZOHOCRMSDK::Profiles::ResponseWrapper
        # Get the list of obtained Profile instances
        profiles = response_handler.profiles
        profiles.each do |profile|
          # Get the DisplayLabel of the each Profile
          print "\n Profile DisplayLabel:"
          print profile.display_label
          unless profile.created_time.nil?
            # Get the CreatedTime of each Profile
            print "\n Profile CreatedTime:"
            print profile.created_time
          end
          unless profile.modified_time.nil?
            # Get the ModifiedTime of each Profile
            print "\n Profile ModifiedTime:"
            print profile.modified_time
          end
          # Get the permissionsDetails of each Profile
          permissions_details = profile.permissions_details
          permissions_details.each do |permissions_detail|
            # Get the DisplayLabel of the each PermissionDetail
            print "\n Profile PermissionDetail DisplayLabel: "
            print permissions_detail.display_label
            # Get the Module of the each PermissionDetail
            print "\n Profile PermissionDetail Module: "
            print permissions_detail.module
            # Get the Name of the each PermissionDetail
            print "\n Profile PermissionDetail Name: "
            print permissions_detail.name
            # Get the ID of the each PermissionDetail
            print "\n Profile PermissionDetail ID: "
            print permissions_detail.id.to_s
            # Get the Enabled of the each PermissionDetail
            print "\n Profile PermissionDetail Enabled: "
            print permissions_detail.enabled
          end
          # Get the Name of the each Profile
          print "\n Profile Name:"
          print profile.name
          created_by = profile.created_by
          # Check if created_by is not None
          unless created_by.nil?
            # Get the Name of the CreatedBy User
            print "\n Profile Created By User-Name:"
            print created_by.name
            # Get the ID of the CreatedBy User
            print "\n Profile Created By User-ID:"
            print created_by.id.to_s
            print "\n"
          end
          defaultview = profile.defaultview
          if !defaultview.nil?
            #Get the Name of the default view
            print "Default view Name : "
            print  defaultview.name
            #Get the id of the default view
            print "Default view id : " 
            print defaultview.id
            #Get the type of the default view
            print "Default view type : " 
            print defaultview.type
          end
          #check if custom profile
          print "is custom profile?  " 
          print profile.custom
          #check if deleted profile
          print "is deleted profile?  " 
          print profile.delete
          #get  permission type profile
          print "permission type   " 
          print profile.permission_type;
          # Get the modifiedBy User instance of each Profile
          modified_by = profile.modified_by
          # Check if modifiedBy is not None
          unless modified_by.nil?
            # Get the Name of the modifiedBy User
            print "\n Profile Modified User-Name:"
            print modified_by.name
            # Get the ID of the modifiedBy User
            print "\n Profile Modified User-ID:"
            print modified_by.id.to_s
            print "\n"
          end
          # Get the Description of the each Profile
          print "\n Profile Description:"
          print profile.description
          # Get the ID of the each Profile
          print "\n Profile ID:"
          print profile.id.to_s

          # Get the sections of each Profile
          sections = profile.sections
          # Get the Name of the each Section
          # Get the categories of each Section
          # Get the DisplayLabel of the each Category
          # Get the permissionsDetails List of each Category
          # Get the permissionsDetailID of the Category
          # Get the Name of the each Category
          sections&.each do |section|
            # Get the Name of the each Section
            print "\n Profile Section Name: "
            print section.name
            # Get the categories of each Section
            categories = section.categories
            categories.each do |category|
              # Get the DisplayLabel of the each Category
              print "\n Profile Section Category DisplayLabel:"
              print category.display_label
              # Get the permissionsDetails List of each Category
              category_permission_details = category.permissions_details
              # Get the permissionsDetailID of the Category
              category_permission_details&.each do |permission_detail_id|
                # Get the permissionsDetailID of the Category
                print "\n Profile Section Category permissionsDetailID: "
                print permission_detail_id
              end
              # Get the Module of the each Category
              print "\n Profile Section Category Module:: "
              print category.module
              # Get the Name of the each Category
              print "\n Profile Section Category Name: "
              print category.name
            end
          end
          unless profile.delete.nil?
            # Get the Delete of the each Profile
            print "\n Profile Delete:"
            print profile.delete
          end
          unless profile.default.nil?
            # Get the Default of the each Profile
            print "\n Profile Default:"
            print profile.default
          end
        end
      # Check if the request returned an exception
      elsif response_handler.is_a? ZOHOCRMSDK::Profiles::APIException
        exception = response_handler
        # Get the Code
        print 'code:'
        print exception.code.value
        # Get the Status
        print "\n status:"
        print exception.status.value
        # Get the details map
        exception.details.each do |k, v|
          print "\n"
          print k
          print v
          print "\n"
        end
        # Get the Message
        print "\n message:"
        print exception.message.value
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
