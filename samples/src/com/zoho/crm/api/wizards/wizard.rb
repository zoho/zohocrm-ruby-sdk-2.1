require 'ZOHOCRMSDK2_1'

class Wizard
  def self.get_wizards()
    # """
    # This method is used to get the wizards data.
    # """


    # Get instance of WizardOperations Class 

    wo = ZOHOCRMSDK::Wizards::WizardsOperations.new()

    # Call get_wizards method
    response = wo.get_wizards()
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if status_code == 204
        print('No Content')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::Wizards::ResponseWrapper
          # Get the list of obtained Wizard instances
            wizards = response_handler.wizards
            wizards.each do |wizard|
                # Get the Modified Time of each Wizard
                print "\nWizard Modified Time: "
                print wizard.modified_time
                # Get the Created Time value of each Wizard
                print "\nWizard Created Time: "
                print wizard.created_time
                # Get the Module of each Wizard
                module_1 = wizard.module
                if !module_1.nil?
                    print "\nWizard Module ID: "
                    print module_1.id
                    print "\nWizard Module API-Name: "
                    print module_1.name
                end
                # Get the Name of each Wizard
                print "\nWizard Name: "
                print wizard.name
                # Get the modifiedBy of each Wizard
                modified_by = wizard.modified_by
                if !modified_by.nil?
                    print "\nWizard modified_by User-ID: "
                    print modified_by.id
                    print "\nWizard modified_by User-Name: "
                    print modified_by.name
                    print "\nWizard modified_by User-Email: "
                    print modified_by.email
                end
                # Get the createdBy of each Wizard
                created_by = wizard.created_by
                if !created_by.nil?
                    print "\nWizard created_by User-ID: "
                    print created_by.id
                    print "\nWizard created_by User-Name: "
                    print created_by.name
                    print "\nWizard created_by User-Email: "
                    print created_by.email
                end
                # Get the parentWizard of each Wizard
                parent_wizard = wizard.parent_wizard
                if !parent_wizard.nil?
                    print "\nWizard parent Wizard User-ID: "
                    print parent_wizard.id
                    print "\nWizard parent Wizard User-Name: "
                    print parent_wizard.name
                end
                
                # Get the active of each Wizard
                print "\nWizard active: "
                print wizard.active
                
                # Get the ID of each Wizard
                print "\nWizard ID: "
                print wizard.id.to_s
                # Get the Draft of each Wizard
                print "\nWizard Draft: "
                print wizard.draft

                
                # Get the profiles of each Wizard
                profiles = wizard.profiles
                profiles.each do|profile|
                    # Get the Profile Name
                    print "\nWizard Profile Name: "
                    print profile.name
                    # Get the Profile ID
                    print "\nWizard Profile ID: "
                    print profile.id
                end
				
                # Get the containers of each Wizard
                containers = wizard.containers
                containers.each do|container|
                    # Get the Container ID
                    print "\n Container Id: "
                    print container.id
                    # Get the Layout 
                    layout = container.layout
                    if !layout.nil?
                        print "\n Layout id"
                        print layout.id
                        print "\n Layout name"
                        print layout.name
                    end
                    # Get the Chart Data 
                    chart_data = container.chart_data
                    if !chart_data.nil?
                        # Get the nodes
                        nodes = chart_data.nodes
                        nodes.each do |node|
                            print "\n Chart Data Node poistion y: "
                            print node.pos_y
                            print "\n Chart Data Node poistion x: "
                            print node.pos_x
                            print "\n Chart Data Node start node : "
                            print node.start_node
                            node_screen = node.screen
                            if !node_screen.nil?
                                print "\n Screen id"
                                print node_screen.id
                                print "\n Screen display label"
                                print node_screen.display_label
                            end
                        end
                        # Get the connections
                        connections = chart_data.connections
                        connections.each do|connection|
                            # Get the target screen
                            connection_screen = connection_screen.target_screen
                            if !connection_screen.nil?
                                print "\n connection_screen id"
                                print connection_screen.id
                                print "\n connection_screen display label"
                                print connection_screen.display_label
                            end
                            # Get the connection source button
                            connection_button = connection_screen.source_button
                            if !connection_button.nil?
                                print "\n connection_button id"
                                print connection_button.id
                                print "\n connection_button display label"
                                print connection_button.display_label
                            end
                        end
                    end
                    # Get chart data
                    chart_data = container.chart_data
                    if !chart_data.nil?
                        print "\n Chart Data Canvas width: "
                        print chart_data.canvas_width
                        print "\n Chart Data Canvas height: "
                        print chart_data.canvas_height
                    end
                    # Get container screens
                    screens = container.screens
                    if !screens.nil?
                        screens.each do|screen|
                            print "\n screen id"
                            print screen.id
                            print "\n screen display label"
                            print screen.display_label
                            # Get container screens segments
                            segments = screen.segments
                            segments.each do|segment|
                                print "\n segment id"
                                print segment.id
                                print "\n segment display label"
                                print segment.display_label
                                print "\n segment  sequence number"
                                print segment.sequence_number
                                print "\n segment type"
                                print segment.type
                                print "\n segment column count"
                                print segment.column_count
                                fields = segment.fields
                                fields.each do|field|
                                    print "\n field id"
                                    print field.id
                                    print "\n field api_name"
                                    print field.api_name
                                end
                                buttons = segment.buttons
                                buttons.each do|button|
                                    criteria = button.criteria
                                    if !criteria.nil?
                                        print_criteria(criteria)
                                    end
                                    target_screen = button.target_screen
                                    if !target_screen.nil?
                                        print "\n target screen id"
                                        print target_screen.id
                                        print "\n target screen display label"
                                        print target_screen.display_label
                                    end
                                    print "\n  Button display label:"
                                    print button.display_label
                                    print "\n  Button id:"
                                    print button.id
                                    print "\n  Button type:"
                                    print button.type
                                    print "\n  Button background color:"
                                    print button.background_color
                                    print "\n  Button sequence number:"
                                    print button.sequence_number
                                    print "\n  Button color:"
                                    print button.color
                                    print "\n  Button type:"
                                    print button.type
                                    print "\n  Button shape:"
                                    print button.shape
                                end
                            end
                        end
                    end
                end		
            end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Wizards::APIException
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

  def self.get_wizard_by_id(wizard_id)
    # """
    # This method is used to get the wizard data.
    # """

    # Get instance of WizardOperations Class 
    
    wo = ZOHOCRMSDK::Wizards::WizardsOperations.new()

    pm = ZOHOCRMSDK::ParameterMap.new
    # Possible parameters for Get Users operation
    pm.add(ZOHOCRMSDK::Wizards::WizardsOperations::GetWizardbyIDParam.layout_id, '34770610091055')

    # Call get_wizard method
    response = wo.get_wizard_by_id(wizard_id, pm)
    unless response.nil?
        status_code = response.status_code
        # Get the status code from response
        print "\n Status Code :" + status_code.to_s
        if status_code == 204
            print('No Content')
            return
        end
        # Check if expected instance is received.
        if response.is_expected
            # Get object from response
            response_handler = response.data_object
            # Check if expected ResponseWrapper instance is received
            if response_handler.is_a? ZOHOCRMSDK::Wizards::ResponseWrapper
            # Get the list of obtained Wizard instances
                wizards = response_handler.wizards
                wizards.each do |wizard|
                    # Get the Modified Time of each Wizard
                    print "\nWizard Modified Time: "
                    print wizard.modified_time
                    # Get the Created Time value of each Wizard
                    print "\nWizard Created Time: "
                    print wizard.created_time
                    # Get the Module of each Wizard
                    module_1 = wizard.module
                    if !module_1.nil?
                        print "\nWizard Module ID: "
                        print module_1.id
                        print "\nWizard Module API-Name: "
                        print module_1.name
                    end
                    # Get the Name of each Wizard
                    print "\nWizard Name: "
                    print wizard.name
                    # Get the modifiedBy of each Wizard
                    modified_by = wizard.modified_by
                    if !modified_by.nil?
                        print "\nWizard modified_by User-ID: "
                        print modified_by.id
                        print "\nWizard modified_by User-Name: "
                        print modified_by.name
                        print "\nWizard modified_by User-Email: "
                        print modified_by.email
                    end
                    # Get the createdBy of each Wizard
                    created_by = wizard.created_by
                    if !created_by.nil?
                        print "\nWizard created_by User-ID: "
                        print created_by.id
                        print "\nWizard created_by User-Name: "
                        print created_by.name
                        print "\nWizard created_by User-Email: "
                        print created_by.email
                    end
                    # Get the parentWizard of each Wizard
                    parent_wizard = wizard.parent_wizard
                    if !parent_wizard.nil?
                        print "\nWizard parent Wizard User-ID: "
                        print parent_wizard.id
                        print "\nWizard parent Wizard User-Name: "
                        print parent_wizard.name
                    end
                    
                
                
                    # Get the active of each Wizard
                    print "\nWizard active: "
                    print wizard.active
                    
                    # Get the ID of each Wizard
                    print "\nWizard ID: "
                    print wizard.id.to_s
                    # Get the Draft of each Wizard
                    print "\nWizard Draft: "
                    print wizard.draft

                    
                    # Get the profiles of each Wizard
                    profiles = wizard.profiles
                    profiles.each do|profile|
                        # Get the Profile Name
                        print "\nWizard Profile Name: "
                        print profile.name
                        # Get the Profile ID
                        print "\nWizard Profile ID: "
                        print profile.id
                    end
                    
                    # Get the containers of each Wizard
                    containers = wizard.containers
                    containers.each do|container|
                        # Get the Container ID
                        print "\n Container Id: "
                        print container.id
                        # Get the Layout 
                        layout = container.layout
                        if !layout.nil?
                            print "\n Layout id"
                            print layout.id
                            print "\n Layout name"
                            print layout.name
                        end
                        # Get the Chart Data 
                        chart_data = container.chart_data
                        if !chart_data.nil?
                            # Get the nodes
                            nodes = chart_data.nodes
                            nodes.each do |node|
                                print "\n Chart Data Node poistion y: "
                                print node.pos_y
                                print "\n Chart Data Node poistion x: "
                                print node.pos_x
                                print "\n Chart Data Node start node : "
                                print node.start_node
                                node_screen = node.screen
                                if !node_screen.nil?
                                    print "\n Screen id"
                                    print node_screen.id
                                    print "\n Screen display label"
                                    print node_screen.display_label
                                end
                            end
                            # Get the connections
                            connections = chart_data.connections
                            if !connections.nil?
                                connections.each do|connection|
                                    # Get the target screen
                                    connection_screen = connection_screen.target_screen
                                    if !connection_screen.nil?
                                        print "\n connection_screen id"
                                        print connection_screen.id
                                        print "\n connection_screen display label"
                                        print connection_screen.display_label
                                    end
                                    # Get the connection source button
                                    connection_button = connection_screen.source_button
                                    if !connection_button.nil?
                                        print "\n connection_button id"
                                        print connection_button.id
                                        print "\n connection_button display label"
                                        print connection_button.display_label
                                    end
                                end
                            end
                        end
                        # Get chart data
                        chart_data = container.chart_data
                        if !chart_data.nil?
                            print "\n Chart Data Canvas width: "
                            print chart_data.canvas_width
                            print "\n Chart Data Canvas height: "
                            print chart_data.canvas_height
                        end
                        # Get container screens
                        screens = container.screens
                        screens.each do|screen|
                            print "\n screen id"
                            print screen.id
                            print "\n screen display label"
                            print screen.display_label
                            # Get container screens segments
                            segments = screen.segments
                            segments.each do|segment|
                                print "\n segment id"
                                print segment.id
                                print "\n segment display label"
                                print segment.display_label
                                print "\n segment  sequence number"
                                print segment.sequence_number
                                print "\n segment type"
                                print segment.type
                                print "\n segment column count"
                                print segment.column_count
                                fields = segment.fields
                                if !fields.nil?
                                    fields.each do|field|
                                        print "\n field id"
                                        print field.id
                                        print "\n field api_name"
                                        print field.api_name
                                    end
                                end
                                buttons = segment.buttons
                                if !buttons.nil?
                                    buttons.each do|button|
                                        criteria = button.criteria
                                        if !criteria.nil?
                                            print_criteria(criteria)
                                        end
                                        target_screen = button.tarscreen
                                        if !target_screen.nil?
                                            print "\n target screen id"
                                            print target_screen.id
                                            print "\n target screen display label"
                                            print target_screen.display_label
                                        end
                                        print "\n  Button display label:"
                                        print button.display_label
                                        print "\n  Button id:"
                                        print button.id
                                        print "\n  Button type:"
                                        print button.type
                                        print "\n  Button background color:"
                                        print button.background_color
                                        print "\n  Button sequence number:"
                                        print button.sequence_number
                                        print "\n  Button color:"
                                        print button.color
                                        print "\n  Button type:"
                                        print button.type
                                        print "\n  Button shape:"
                                        print button.shape
                                    end
                                end
                            end
                        end
                    end		
                end
            # Check if the request returned an exception
            elsif response_handler.is_a? ZOHOCRMSDK::Wizards::APIException
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
      print "\n Field Criteria Comparator:"
      print criteria.comparator.value
    end
    unless criteria.value.nil?
      print "\n Field Criteria Value::"
      print criteria.value
    end
    print "\n Field Criteria field:"
    print criteria.field
    criteria_group = criteria.group
    criteria_group&.each do |criteria|
      print_criteria(criteria)
    end
    unless criteria.group_operator.nil?
      print "\n Field Criteria Group Operator: "
      print criteria.group_operator.value
    end
  end
end
