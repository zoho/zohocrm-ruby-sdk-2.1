require 'ZCRMSDK'

class Role
  def self.get_roles
    # """
    # This method is used to retrieve the data of roles through an API request and print the response.
    # """

    # Get instance of RolesOperations Class
    rlo = Roles::RolesOperations.new
    # Call getRoles method
    response = rlo.get_roles
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
        if response_handler.is_a? Roles::ResponseWrapper
          # Get the list of obtained Role instances
          roles = response_handler.roles
          roles.each do |role|
            # Get the DisplayLabel of each Role
            print "\n Role DisplayLabel: "
            print role.display_label
            # Get the forecastManager User instance of each Role
            forecast_manager = role.forecast_manager
            # Check if forecastManager is not None
            unless forecast_manager.nil?
              # Get the ID of the forecast Manager
              print "\n Role Forecast Manager User-ID: "
              print forecast_manager.id.to_s
              # Get the name of the forecast Manager
              print "\n Role Forecast Manager User-Name: "
              print forecast_manager.name
            end
            # Get the ShareWithPeers of each Role
            print "\n Role ShareWithPeers: "
            print role.share_with_peers
            # Get the Name of each Role
            print "\n Role Name: "
            print role.name
            # Get the Description of each Role
            print "\n Role Description: "
            print role.description
            # Get the Id of each Role
            print "\n Role ID: "
            print role.id.to_s
            # Get the reporting_to User instance of each Role
            reporting_to = role.reporting_to
            # Check if reporting_to is not None
            unless reporting_to.nil?
              # Get the ID of the reporting_to User
              print "\n Role ReportingTo User-ID: "
              print reporting_to.id.to_s
              # Get the name of the reporting_to User
              print "\n Role ReportingTo User-Name: "
              print reporting_to.name
            end
            # Get the AdminUser of each Role
            print "\n Role AdminUser: "
            print role.admin_user
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Roles::APIException
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

  def self.get_role(role_id)
    # """
    # This method is used to retrieve the data of single role with ID and print the response.
    # :param role_id: The ID of the role to be obtained
    # """

    # """
    # example
    # role_id = 340964300026005
    # """
    # Get instance of RolesOperations Class
    rlo = Roles::RolesOperations.new
    # Call get_role method that takes role_id as parameter
    response = rlo.get_role(role_id)
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
        if response_handler.is_a? Roles::ResponseWrapper
          # Get the list of obtained Role instances
          roles = response_handler.roles
          roles.each do |role|
            # Get the DisplayLabel of each Role
            print "\n Role DisplayLabel: "
            print role.display_label
            # Get the forecastManager User instance of each Role
            forecast_manager = role.forecast_manager
            # Check if forecastManager is not None
            unless forecast_manager.nil?
              # Get the ID of the forecast Manager
              print "\n Role Forecast Manager User-ID: "
              print forecast_manager.id.to_s
              # Get the name of the forecast Manager
              print "\n Role Forecast Manager User-Name: "
              print forecast_manager.name
            end
            # Get the ShareWithPeers of each Role
            print "\n Role ShareWithPeers: "
            print role.share_with_peers
            # Get the Name of each Role
            print "\n Role Name: "
            print role.name
            # Get the Description of each Role
            print "\n Role Description: "
            print role.description
            # Get the Id of each Role
            print "\n Role ID: "
            print role.id.to_s
            # Get the reporting_to User instance of each Role
            reporting_to = role.reporting_to
            # Check if reporting_to is not None
            unless reporting_to.nil?
              # Get the ID of the reporting_to User
              print "\n Role ReportingTo User-ID: "
              print reporting_to.id.to_s
              # Get the name of the reporting_to User
              print "\n Role ReportingTo User-Name: "
              print reporting_to.name
            end
            # Get the AdminUser of each Role
            print "\n Role AdminUser: "
            print role.admin_user
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Roles::APIException
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
end
