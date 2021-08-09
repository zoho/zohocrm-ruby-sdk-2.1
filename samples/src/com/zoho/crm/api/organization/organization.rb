require 'ZCRMSDK'

class Organization
  def self.get_organization
    # """
    # This method is used to get the organization data and print the response.
    # """
    # Get instance of OrgOperations Class
    org_operation = Org::OrgOperations.new
    # Call get_organization method
    response = org_operation.get_organization
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? Org::ResponseWrapper
          # Get the list of obtained Org instances
          orgs = response_handler.org
          orgs.each do |org|
            # Get the Country of each Organization
            print "\n Organization Country: "
            print org.country
            hierarchy_preferences = org.hierarchy_preferences
            unless hierarchy_preferences.nil?
              print "\nOrganization HierarchyPreferences Type: "
              print hierarchy_preferences.type
            end
            # Get the HipaaComplianceEnabled of each Organization
            print "\n Organization HipaaComplianceEnabled: "
            print org.hipaa_compliance_enabled
            # Get the PhotoId of each Organization
            print "\n Organization PhotoId: "
            print org.photo_id
            # Get the City of each Organization
            print "\n Organization City: "
            print org.city
            # Get the Description of each Organization
            print "\n Organization Description: "
            print org.description
            # Get the McStatus of each Organization
            print "\n Organization McStatus: "
            print org.mc_status
            # Get the GappsEnabled of each Organization
            print "\n Organization GappsEnabled: "
            print org.gapps_enabled
            # Get the DomainName of each Organization
            print "\n Organization DomainName: "
            print org.domain_name
            # Get the TranslationEnabled of each Organization
            print "\n Organization TranslationEnabled: "
            print org.translation_enabled
            print "\n Organization Street: "
            print org.street
            # Get the Alias of each Organization
            print "\n Organization Alias: "
            print org.alias
            print "\n Organization Currency: "
            print org.currency
            # Get the Id of each Organization
            print "\n Organization id: "
            print org.id.to_s
            # Get the State of each Organization
            print "\n Organization State: "
            print org.state
            # Get the Fax of each Organization
            print "\n Organization Fax: "
            print org.fax
            # Get the EmployeeCount of each Organization
            print "\n Organization EmployeeCount: "
            print org.employee_count
            # Get the Zip of each Organization
            print "\n Organization Zip: "
            print org.zip
            # Get the Website of each Organization
            print "\n Organization Website: "
            print org.website
            # Get the CurrencySymbol of each Organization
            print "\n Organization CurrencySymbol: "
            print org.currency_symbol
            # Get the Mobile of each Organization
            print "\n Organization Mobile: "
            print org.mobile
            # Get the CurrencyLocale of each Organization
            print "\n Organization CurrencyLocale: "
            print org.currency_locale
            # Get the PrimaryZuid of each Organization
            print "\n Organization PrimaryZuid: "
            print org.primary_zuid
            # Get the ZiaPortalId of each Organization
            print "\n Organization ZiaPortalId: "
            print org.zia_portal_id
            # Get the TimeZone of each Organization
            print "\n Organization TimeZone: "
            print org.time_zone
            # Get the Zgid of each Organization
            print "\n Organization Zgid: "
            print org.zgid
            # Get the CountryCode of each Organization
            print "\n Organization CountryCode: "
            print org.country_code
            # Get the obtained LicenseDetails instance
            license_details = org.license_details
            unless license_details.nil?
              # Get the PaidExpiry of LicenseDetails
              print "\n Organization LicenseDetails PaidExpiry: "
              print license_details.paid_expiry
              # Get the UsersLicensePurchased of LicenseDetails
              print "\n Organization LicenseDetails UsersLicensePurchased: "
              print license_details.users_license_purchased
              # Get the TrialType of LicenseDetails
              print "\n Organization LicenseDetails TrialType: "
              print license_details.trial_type
              # Get the TrialExpiry of LicenseDetails
              print "\n Organization LicenseDetails TrialExpiry: "
              print license_details.trial_expiry
              # Get the Paid of LicenseDetails
              print "\n Organization LicenseDetails Paid: "
              print license_details.paid
              # Get the PaidType of LicenseDetails
              print "\n Organization LicenseDetails PaidType: "
              print license_details.paid_type
            end
            # Get the Phone of each Organization
            print "\n Organization Phone: "
            print org.phone
            # Get the CompanyName of each Organization
            print "\n Organization CompanyName: "
            print org.company_name
            # Get the PrivacySettings of each Organization
            print "\n Organization PrivacySettings: "
            print org.privacy_settings
            # Get the PrimaryEmail of each Organization
            print "\n Organization PrimaryEmail: "
            print org.primary_email
            # Get the IsoCode of each Organization
            print "\n Organization IsoCode: "
            print org.iso_code
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Org::APIException
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

  def self.upload_organization_photo(absolute_file_path)
    # """
    # This method is used to upload the brand logo or image of the organization and print the response.
    # :param absolute_file_path: The absolute file path of the file to be attached
    # """

    # """
    # example
    # absolute_file_path = "/Users/user_name/Desktop/logo.png";
    # """
    # Get instance of OrgOperations Class
    org_operation = Org::OrgOperations.new
    fbw = Org::FileBodyWrapper.new
    # """
    # StreamWrapper can be initialized in any of the following ways

    # * param 1 -> fileName
    # * param 2 -> Read Stream.
    # * param 3 -> Absolute File Path of the file to be attached
    # """
    # stream_wrapper = StreamWrapper.new(name,stream,absolutefilepath)
    sw = Util::StreamWrapper.new(nil, nil, absolute_file_path)
    # Set file to the FileBodyWrapper instance
    fbw.file = sw
    response = org_operation.upload_organization_photo(fbw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected SuccessResponse instance is received
        if action_handler.is_a? Org::SuccessResponse
          success_response = action_handler
          # Get the Code
          print 'code:'
          print success_response.code.value
          # Get the status
          print "\n status:"
          print success_response.status.value
          # Get the message
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
        elsif action_handler.is_a? Org::APIException
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
