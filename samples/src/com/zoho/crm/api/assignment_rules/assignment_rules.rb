require 'ZOHOCRMSDK2_1'

class Assignment_Rules
  def self.get_assignment_rules()
    # """
    # This method is used to get the assignment rules data.
    # """


    # Get instance of AssignmentRuleOperations Class 

    aro = ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations.new()

    # Call get_assignment_rules method
    response = aro.get_assignment_rules()
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\nStatus Code :" + status_code.to_s
      if status_code == 204
        print('No Content')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::AssignmentRules::ResponseWrapper
          # Get the list of obtained AssignmentRule instances
            assignment_rules = response_handler.assignment_rules
            assignment_rules.each do |ar|
                # Get the Modified Time of each AssignmentRule
                print "\nAssignmentRule Modified Time: "
                print ar.modified_time
                # Get the Created Time value of each AssignmentRule
                print "\nAssignmentRule Created Time: "
                print ar.created_time
                # Get the DefaultUser of each AssignmentRule
                default_assignee = ar.default_assignee
                if !default_assignee.nil?
                    print "\nAssignmentRule DefaultUser User-ID: "
                    print default_assignee.id
                    print "\nAssignmentRule DefaultUser User-Name: "
                    print default_assignee.name
                end
                # Get the Module of each AssignmentRule
                module_1 = ar.module
                if !module_1.nil?
                    print "\nAssignmentRule Module ID: "
                    print module_1.id
                    print "\nAssignmentRule Module API-Name: "
                    print module_1.name
                end
                # Get the modifiedBy of each AssignmentRule
                modified_by = ar.modified_by
                if !modified_by.nil?
                    print "\nAssignmentRule modified_by User-ID: "
                    print modified_by.id
                    print "\nAssignmentRule modified_by User-Name: "
                    print modified_by.name
                    print "\nAssignmentRule modified_by User-Email: "
                    print modified_by.email
                end
                # Get the createdBy of each AssignmentRule
                created_by = ar.created_by
                if !created_by.nil?
                    print "\nAssignmentRule created_by User-ID: "
                    print created_by.id
                    print "\nAssignmentRule created_by User-Name: "
                    print created_by.name
                    print "\nAssignmentRule created_by User-Email: "
                    print created_by.email
                end
                
                # Get the Name of each AssignmentRule
                print "\nAssignmentRule Name: "
                print ar.name
                # Get the ID of each AssignmentRule
                print "\nAssignmentRule ID: "
                print ar.id.to_s
                # Get the description of each AssignmentRule
                print "\nAssignmentRule description: "
                print ar.description
            end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::AssignmentRules::APIException
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

  def self.get_assignment_rule(assignment_rule_id)
    # """
    # This method is used to get the assignment rule data.
    # """


    # Get instance of AssignmentRuleOperations Class 

    aro = ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations.new()
    pm = ZOHOCRMSDK::ParameterMap.new
    pm.add(ZOHOCRMSDK::AssignmentRules::AssignmentRulesOperations::GetAssignmentRuleParam.module_1, "Leads")
    # Call get_assignment_rule method
    response = aro.get_assignment_rule(assignment_rule_id, pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\nStatus Code :" + status_code.to_s
      if status_code == 204
        print('No Content')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::AssignmentRules::ResponseWrapper
          # Get the list of obtained AssignmentRule instances
            assignment_rules = response_handler.assignment_rules
            assignment_rules.each do |ar|
                # Get the Modified Time of each AssignmentRule
                print "\nAssignmentRule Modified Time: "
                print ar.modified_time
                # Get the Created Time value of each AssignmentRule
                print "\nAssignmentRule Created Time: "
                print ar.created_time
                # Get the DefaultUser of each AssignmentRule
                default_assignee = ar.default_assignee
                if !default_assignee.nil?
                    print "\nAssignmentRule DefaultUser User-ID: "
                    print default_assignee.id
                    print "\nAssignmentRule DefaultUser User-Name: "
                    print default_assignee.name
                end
                # Get the Module of each AssignmentRule
                module_1 = ar.module
                if !module_1.nil?
                    print "\nAssignmentRule Module ID: "
                    print module_1.id
                    print "\nAssignmentRule Module API-Name: "
                    print module_1.name
                end
                # Get the modifiedBy of each AssignmentRule
                modified_by = ar.modified_by
                if !modified_by.nil?
                    print "\nAssignmentRule modified_by User-ID: "
                    print modified_by.id
                    print "\nAssignmentRule modified_by User-Name: "
                    print modified_by.name
                    print "\nAssignmentRule modified_by User-Email: "
                    print modified_by.email
                end
                # Get the createdBy of each AssignmentRule
                created_by = ar.created_by
                if !created_by.nil?
                    print "\nAssignmentRule created_by User-ID: "
                    print created_by.id
                    print "\nAssignmentRule created_by User-Name: "
                    print created_by.name
                    print "\nAssignmentRule created_by User-Email: "
                    print created_by.email
                end
                
                # Get the Name of each AssignmentRule
                print "\nAssignmentRule Name: "
                print ar.name
                # Get the ID of each AssignmentRule
                print "\nAssignmentRule ID: "
                print ar.id.to_s
                # Get the description of each AssignmentRule
                print "\nAssignmentRule description: "
                print ar.description
            end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::AssignmentRules::APIException
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
