require 'ZOHOCRMSDK2_1'

class Territory
  def self.get_territories
    # """
    # This method is used to get the list of territories enabled for your organization and print the response.
    # """
    # Get instance of TerritoriesOperations Class
    to = ZOHOCRMSDK::Territories::TerritoriesOperations.new
    # Call get_territories method
    response = to.get_territories
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
        if response_handler.is_a? ZOHOCRMSDK::Territories::ResponseWrapper
          # Get the list of obtained Territory instances
          territories = response_handler.territories
          territories.each do |territory|
            # Get the CreatedTime of each Territory
            print "\n Territory CreatedTime:"
            print territory.created_time
            # Get the ModifiedTime of each Territory
            print "\n Territory ModifiedTime:"
            print territory.modified_time
            # Get the manager User instance of each Territory
            manager = territory.manager
            # Check if manager is not null
            unless manager.nil?
              # Get the Name of the Manager
              print "\n Territory Manager User-Name: "
              print manager.name
              # Get the ID of the Manager
              print "\n Territory Manager User-ID: "
              print manager.id.to_s
            end

            deal_rule_criteria = territory.deal_rule_criteria
            print_criteria(deal_rule_criteria) unless deal_rule_criteria.nil?
            accounts_rule_criteria = territory.account_rule_criteria
            print_criteria(accounts_rule_criteria) unless accounts_rule_criteria.nil?
            # Get the Name of each Territory
            print "\n Territory Name:"
            print territory.name
            # Get the Description of each Territory
            print "\n Territory Description:"
            print territory.description
            # Get the Id of each Territory
            print "\n Territory Id:"
            print territory.id.to_s
            # Get the modifiedBy User instance of each Territory
            modified_by = territory.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n Territory Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n Territory Modified By User-ID: "
              print modified_by.id.to_s
            end
            # Get the createdBy User instance of each Territory
            created_by = territory.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Territory Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Territory Created By User-ID: "
              print created_by.id.to_s
            end
            # Get the permission type of each Territory
            print "\n Territory permission type:"
            print territory.permission_type
          end
          info = response_handler.info

          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n Territory Info Per page: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Territory Info Count: "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n Territory Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n Territory Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Territories::APIException
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

  def self.get_territory(territory_id)
    # """
    # This method is used to get the single territory with id and print the response.
    # :param territory_id: The ID of the Territory to be obtained
    # """

    # """
    # example
    # territory_id = '34096430505351'
    # """
    # Get instance of TerritoriesOperations Class
    to = ZOHOCRMSDK::Territories::TerritoriesOperations.new
    # Call get_territory method that takes territory_id as parameter
    response = to.get_territory(territory_id)
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
        if response_handler.is_a? ZOHOCRMSDK::Territories::ResponseWrapper
          # Get the list of obtained Territory instances
          territories = response_handler.territories
          territories.each do |territory|
            # Get the CreatedTime of each Territory
            print "\n Territory CreatedTime:"
            print territory.created_time
            # Get the ModifiedTime of each Territory
            print "\n Territory ModifiedTime:"
            print territory.modified_time
            # Get the manager User instance of each Territory
            manager = territory.manager
            # Check if manager is not null
            unless manager.nil?
              # Get the Name of the Manager
              print "\n Territory Manager User-Name: "
              print manager.name
              # Get the ID of the Manager
              print "\n Territory Manager User-ID: "
              print manager.id.to_s
            end

            deal_rule_criteria = territory.deal_rule_criteria
            print_criteria(deal_rule_criteria) unless deal_rule_criteria.nil?
            accounts_rule_criteria = territory.account_rule_criteria
            print_criteria(accounts_rule_criteria) unless accounts_rule_criteria.nil?
            # Get the Name of each Territory
            print "\n Territory Name:"
            print territory.name
            # Get the Description of each Territory
            print "\n Territory Description:"
            print territory.description
            # Get the Id of each Territory
            print "\n Territory Id:"
            print territory.id.to_s
            # Get the permission type of each Territory
            print "\n Territory permission type:"
            print territory.permission_type
            # Get the modifiedBy User instance of each Territory
            modified_by = territory.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n Territory Modified By User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n Territory Modified By User-ID: "
              print modified_by.id.to_s
            end
            # Get the createdBy User instance of each Territory
            created_by = territory.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Territory Created By User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Territory Created By User-ID: "
              print created_by.id.to_s
            end
             # Get the ReportingTo User instance of each Territory
             reporting_to = territory.reporting_to
             # Check if reporting_to is not None
             unless reporting_to.nil?
               # Get the Name of the reporting_to User
               print "\n Territory Reporting To User-Name: "
               print reporting_to.name
               # Get the ID of the reporting_to User
               print "\n Territory Reporting To User-ID: "
               print reporting_to.id.to_s
             end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Territories::APIException
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
    unless criteria.comparator.nil?
      # Get the Comparator of the Criteria
      print "\n Territory Criteria Comparator:"
      print criteria.comparator.value
    end
    unless criteria.value.nil?
      # Get the Field of the Criteria
      print "\Territory Criteria Value::"
      print criteria.value
    end
    print "\n Territory Criteria field:"
    print criteria.field
    # Get the List of Criteria instance of each Criteria
    criteria_group = criteria.group
    criteria_group&.each do |criteria|
      print_criteria(criteria)
    end
    unless criteria.group_operator.nil?
      # Get the Group Operator of the Criteria
      print "\Territory Criteria Group Operator: "
      print criteria.group_operator.value
    end
  end
end
