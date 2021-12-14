require 'ZOHOCRMSDK2_1'

class Blueprint
  def self.get_blueprint(module_api_name, record_id)
    # """
    # This method is used to get a single record's Blueprint details with ID and print the response.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to get Blueprint
    # """

    # """
    # example
    # module_api_name = "Leads"
    # record_id = "34096432469044"
    # """

    # Get instance of BluePrintOperations Class that takes module_api_name and record_id as parameter
    bpo = ZOHOCRMSDK::BluePrint::BluePrintOperations.new(record_id, module_api_name)
    # Call get_blueprint method
    response = bpo.get_blueprint

    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_codes == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received
        if response_handler.is_a? ZOHOCRMSDK::BluePrint::ResponseWrapper
          # Get the obtained BluePrint instance
          blueprint = response_handler.blueprint
          # Get the ProcessInfo instance of the obtained BluePrint
          process_info = blueprint.process_info
          # Check if ProcessInfo is not None
          unless process_info.nil?
            print "\n ProcessInfo Field-ID: "
            # Get the Field ID of the ProcessInfo
            print process_info.field_id
            # Get the isContinuous of the ProcessInfo
            print "\n ProcessInfo isContinuous: "
            print process_info.is_continuous
            # Get the API Name of the ProcessInfo
            print "\n ProcessInfo API Name: "
            print process_info.api_name
            # Get the Continuous of the ProcessInfo
            print "\n ProcessInfo Continuous: "
            print process_info.continuous
            # Get the FieldLabel of the ProcessInfo
            print "\n ProcessInfo FieldLabel: "
            print process_info.field_label
            # Get the Name of the ProcessInfo
            print "\n ProcessInfo Name: "
            print process_info.name
            # Get the ColumnName of the ProcessInfo
            print "\n ProcessInfo ColumnName: "
            print process_info.column_name
            # Get the FieldValue of the ProcessInfo
            print "\n ProcessInfo FieldValue: "
            print process_info.field_value
            # Get the ID of the ProcessInfo
            print "\n ProcessInfo ID: "
            print process_info.id.to_s
            # Get the FieldName of the ProcessInfo
            print "\n ProcessInfo FieldName: "
            print process_info.field_name
            escalation = process_info.escalation
            if !escalation.nil?
               # Get the Escalation days
              print "\n Escalation days: "
              print escalation.days
              # Get the Escalation status
              print "\n Escalation status: "
              print escalation.status
            end
          end
          # Get the list of transitions from BluePrint instance
          transitions = blueprint.transitions
          transitions.each do |transition|
            next_transitions = transition.next_transitions
            next_transitions.each do |next_transition|
              # Get the ID of the NextTransition
              print "\n Next transition ID: "
              print next_transition.id.to_s
              # Get the Name of the NextTransition
              print "\n Next transition Name: "
              print next_transition.name
              # Get the criteria_matched of the NextTransition
              print "\n Next transition criteria_matched: "
              print next_transition.criteria_matched.to_s
              # Get the type of the NextTransition
              print "\n Next transition type: "
              print next_transition.type
            end
            parent_transition = transition.parent_transition
            if !parent_transition.nil?
              print "\n Parenttransition ID: "
              print parent_transition.id
            end
            print 'Transition PercentPartialSave: '
            print transition.percent_partial_save
            print 'Transition ExecutionTime: '
            print transition.execution_time
            print 'Transition Type: '
            print transition.type
            data = transition.data

            unless data.nil?
              # Get the ID of the Record
              print 'Record ID: '
              print data.id.to_s
              # Get the createdBy User instance of the Record
              created_by = data.created_by
              # Check if created_by is not None
              unless created_by.nil?
                # Get the ID of the created_by User
                print "\n Record Created By User-ID: "
                print created_by.id.to_s
                # Get the Name of the created_by User
                print "\n Record Created By User-Name: "
                print created_by.name
              end
              # Get the CreatedTime of the Record
              created_time = data.created_time
              unless created_time.nil?
                print "\n Record Created Time:"
                print created_time
              end
              # Get the ModifiedTime of each Record
              modified_time = data.modified_time
              unless modified_time.nil?
                print "\n Record Modified Time:"
                print modified_time
              end
              # Get the modified_by User instance of the Record
              modified_by = data.modified_by
              # Check if modifiedBy is not None
              unless modified_by.nil?
                # Get the ID of the modified_by User
                print "\n Record Modified By User-ID: "
                print modified_by.id.to_s
                # Get the Name of the modified_by User
                print "\n Record Modified By User-Name: "
                print modified_by.name
              end
              # Get the list of obtained Tag instance of the Record
              tags = data.tag
              if !tags.nil? && tags.size.positive?
                tags.each do |tag|
                  # Get the Name of each Tag
                  print "\n Record Tag Name: "
                  print tag.name
                  # Get the Id of each Tag
                  print "\n Record Tag ID: "
                  print tag.id.to_s
                end
              end
              data.get_key_values.each do |k, v|
                print "\n"
                print k
                print v
              end
            end
            # Get the NextFieldValue of the Transition
            print "\n Transition NextFieldValue: "
            print transition.next_field_value
            # Get the Name of each Transition
            print "\n Transition Name: "
            print transition.name
            # Get the CriteriaMatched of the Transition
            print "\n Transition CriteriaMatched: "
            print transition.criteria_matched
            # Get the ID of the Transition
            print "\n Transition ID: "
            print transition.id.to_s

            print "\n Transition Fields: "
            fields = transition.fields
            fields.each do |field|
              # Get the Webhook of each Field
              print "\n Webhook"
              print field.webhook
              # Get the JsonType of each Field
              print "\n JsonType"
              print field.json_type
              # Get the DisplayLabel of each Field
              print "\n DisplayLabel"
              print field.display_label
              # Get the DataType of each Field
              print "\n DataType"
              print field.data_type
              # Get the ColumnName of each Field
              print "\n ColumnName"
              print field.column_name
              # Get the PersonalityName of each Field
              print "\n PersonalityName"
              print field.personality_name
              # Get the ID of each Field
              print "\n ID"
              print field.id.to_s
              # Get the Sortable of each Field
              print "\n Sortable"
              print field.sortable
              # Get the TransitionSequence of each Field
              print "\n TransitionSequence"
              print field.transition_sequence
              
              unless field.external.nil?
                print "\n  External Show:"
                print field.external.show
                print "\n External Type"
                print field.external.type
                print "\n External Type"
                print field.external.allow_multiple_config
              end
              unless field.unique.nil?
                # Get the Casesensitive of each Unique
                print "\n unique casesensitive"
                print field.unique.casesensitive
              end
              unless field.history_tracking.nil?
                module_1 = field.history_tracking.module
                unless module_1.nil?
                  module_layout = module_1.layout
                  unless module_layout.nil?
                    print "Module layout id"
                    print module_layout.id
                  end
                  print "Module  display label"
                  print module_1.display_label
                  print "Module  api name"
                  print module_1.api_name
                  print "Module  ID"
                  print module_1.id
                  print "Module  module"
                  print module_1.module
                  print "Module  module name"
                  print module_1.module_name
                end
                duration_configured = field.history_tracking.duration_configured
                unless duration_configured.nil?
                  print duration_configured.id
                end
              end
              unless field.mandatory.nil?
                # Get the Mandatory of each Field
                print "\n mandatory"
                print field.mandatory
              end
              # Get the obtained Layout instance
              layout = field.layouts
              # Check if layout is not null
              unless layout.nil?
                # Get the ID of the Layout
                print "\n Layout ID:"
                print layout.id.to_s
                # Get the Name of the Layout
                print "\n Layout Name:"
                print layout.name
              end
              # Get the APIName of each Field
              print "\n APIName :"
              print field.api_name
              # Get the Content of each Field
              print "\n Content :"
              print field.content
              # Get the SystemMandatory of each Field
              if field.system_mandatory.nil?
                print "\n System_mandatory"
                print field.system_mandatory
              end
              print "\n Field is Private :"
              print field.private
              print "\n Field is UiType :"
              print field.ui_type
              print "\n Field  PickListValuesSortedLexically :"
              print field.pick_list_values_sorted_lexically

              related_details = field.related_details
              unless related_details.nil?
                unless related_details.display_label.nil?
                  print "\n RelatedDetails Display Label: "
                  print related_details.display_label
                end
                unless related_details.module
                  module_ins = elated_details.module
                  unless module_ins.layout.nil?
                    layout = module_ins.layout
                    print "\n Related Details Module Layout ID: "
                    print layout.id
                    print "\n Related Details Module Layout Name: "
                    print layout.name
                  end
                  unless module_ins.display_label.nil?
                    print "\n Related Details Module Display Label:: "
                    print module_ins.display_label
                  end
                  print "\n Related Details Module API Name: "
                  print module_ins.api_name
                  print "\n Related Details Module : "
                  print module_ins.module
                  print "\n Related Details Module Name: "
                  print module_ins.module_name
                end
                print "\n RelatedDetails ID : "
                print related_details.id
                print "\n RelatedDetails Type : "
                print related_details.type
                print "\n RelatedDetails API Name: "
                print related_details.api_name

              end
              crypt = field.crypt
              unless crypt.nil?
                # Get the Crypt Mode
                print "\nField Crypt Mode:"
                print crypt.mode
                # Get the Crypt Column
                print "\nField Crypt Column:"
                # Get the Crypt Table
                print crypt.column
                print "\nField Crypt Table:"
                print crypt.table
                # Get the Crypt Status
                print "\nField Crypt Status:"
                print crypt.status
              end
              # Get the FieldLabel of each Field
              print "\n Field Label"
              print field.field_label
              tooltip = field.tooltip
              unless tooltip.nil?
                # Get the Name of the ToolTip
                print "\n Tooltip Name "
                print tooltip.name
                # Get the Value of the ToolTip
                print "\n Tooltip Value "
                print tooltip.value
              end
              unless field.currency.nil?
                # Get the RoundingOptioN of the Currency
                print "\nCurrency RoundingOption "
                print field.currency.rounding_option
                # Get the Precision of the ToolTip
                print "\n Currency Precision: "
                print field.currency.precision
              end
              lookup = field.lookup
              unless lookup.nil?
                layout  = lookup.layout
                unless layout.nil?
                  #Get the ID of the Layout
                  print "\n Field ModuleLookup Layout ID: "
                  print layout.id
                  #Get the Name of the Layout
                  print "\n Field ModuleLookup Layout Name: "
                  print layout.name
                end
                formula = field.formula
                # Check if formula is not null
                unless formula.nil?
                  # Get the ReturnType of the Formula
                  print "\nField Formula ReturnType : "
                  print formula.return_type
                  # Get the Expression of the Formula
                  unless formula.expression.nil?
                    print "\nField Formula Expression : "
                    print formula.expression
                  end
                end
                unless field.decimal_place.nil?
                  # Get the DecimalPlace of each Field
                  print "\nField DecimalPlace: "
                  print field.decimal_place
                end
                #Get the DisplayLabel of the Module
								print "Field ModuleLookup DisplayLabel: "
                print lookup.display_label

								#Get the APIName of the Module
								print "Field ModuleLookup APIName: "
                print lookup.api_name

								#Get the Module of the Module
								print "Field ModuleLookup Module: "
                
                print lookup.module
                print "Field ModuleLookup ID: "
                print lookup.id
              end
              # Get the CreatedSource of each Field
              print "\n Created Source"
              print field.created_source
              unless field.display_type
                print "\n DisplayType:"
                print field.display_type
              end
              print "\n Filterable:"
              print field.filterable
              # Get the validationRule dict
              unless field.convert_mapping.nil?
                field.convert_mapping&.each do |k, v|
                  print "\n"
                  print k
                  print v
                  print "\n"
                end
              end
              profiles = field.profiles
              unless profiles.nil?
                profiles.each do |profile|
                  print "\n Field Profile PermissionType: "
                  print profile.permission_type
                  print "\n Field Profile Name: "
                  print profile.name
                  print "\n Field Profile ID: "
                  print profile.id
                end
              end
              unless field.read_only
                print "\n ReadOnly:"
                print field.read_only
              end
              # Get the FieldReadOnly of each Field
              unless field.field_read_only
                print "\n FieldReadOnly:"
                print field.field_read_only
              end
              # Get the obtained AssociationDetails instance
              association_details = field.association_details
              unless association_details.nil?
                # Get the obtained LookupField instance
                lookup_field = association_details.lookup_field
                unless lookup_field.nil?
                  # Get the ID of the LookupField
                  print "\nField AssociationDetails LookupField ID: "
                  print lookup_field.id.to_s
                  # Get the Name of the LookupField
                  print "\nField AssociationDetails LookupField Name: "
                  print lookup_field.name
                end
                # Get the obtained LookupField instance
                related_field = association_details.related_field
                unless related_field.nil?
                  # Get the ID of the RelatedField
                  print "\nField AssociationDetails RelatedField ID: "
                  print related_field.id.to_s
                  # Get the Name of the RelatedField
                  print "\nField AssociationDetails RelatedField Name: "
                  print related_field.name
                end
              end
              # Get the DisplayLabel of each Field
              print "\n Display Label"
              print field.display_label
              unless field.quick_sequence_number
                print "\n QuickSequenceNumber:"
                print field.quick_sequence_number
              end
              unless field.custom_field
                # Get if the Field is a CustomField
                print "\n CustomField:"
                print field.custom_field
              end
              unless field.visible
                # Get the Visible of each Field
                print "\n Visible:"
                print field.visible
              end
              unless field.length
                # Get the Length of each Field
                print "\n Length:"
                print field.length
              end
              print "\n DecimalPlace:"
              # Get the DecimalPlace of each Field
              print field.decimal_place
              view_type = field.view_type
              unless view_type.nil?
                # Get the View of the ViewType
                print "\n View:"
                print view_type.view
                # Get the Edit of the ViewType
                print "\n Edit:"
                print view_type.edit
                # Get the Create of the ViewType
                print "\n Create:"
                print view_type.create
                # Get the QuickCreate of the ViewType
                print "\n Quick Create:"
                print view_type.quick_create
              end
              pick_list_values = field.pick_list_values

              pick_list_values&.each do |pick_list_value|
                print_pick_list_value(pick_list_value)
              end
              # Check if multiSelectLookup is not None
              multi_select_lookup = field.multiselectlookup
              unless multi_select_lookup.nil?
                # Get the DisplayValue of the MultiSelectLookup
                print "\n DisplayLabel:"
                print multi_select_lookup.display_label
                # Get the LinkingModule of the MultiSelectLookup
                print "\n LinkingModule:"
                print multi_select_lookup.linking_module
                # Get the LookupApiname of the MultiSelectLookup
                print "\n LookupApiname:"
                print multi_select_lookup.lookup_apiname
                # Get the APIName of the MultiSelectLookup
                print "\n APIName:"
                print multi_select_lookup.api_name
                # Get the ConnectedlookupApiname of the MultiSelectLookup
                print "\n ConnectedlookupApiname:"
                print multi_select_lookup.connectedlookup_apiname
                # Get the ID of the MultiSelectLookup
                print "\n ID:"
                print multi_select_lookup.id.to_s
                # Get the Connected type of the MultiSelectLookup
                print "\n connected module:"
                print multi_select_lookup.connected_module
              end
              # Check if MultiModuleLookup is not None
              multi_module_lookup = field.multi_module_lookup
              unless multi_module_lookup.nil?
               
                unless multi_module_lookup.module.nil? 
                  print "\n MultiModuleLookup Module APIName:"
                  print multi_module_lookup.module.id
                  print "\n MultiModuleLookup Module ID:"
                  print multi_module_lookup.module.api_name
                end
                print "\n Lookup name ::"
                print multi_module_lookup.name
                print "\n Lookup ID ::"
                print multi_module_lookup.id
               
              end
              auto_number = field.auto_number
              # Check if autoNumber is not None
              unless auto_number.nil?
                # Get the Prefix of the AutoNumber
                print "\n Prefix"
                print auto_number.prefix
                # Get the Suffix of the AutoNumber
                print "\n Suffix"
                print auto_number.suffix
                unless auto_number.start_number.nil?
                  # Get the StartNumber of the AutoNumber
                  print "\n StartNumber"
                  print auto_number.start_number
                end
              end
            end
            # Get the CriteriaMessage of each Transition
            print "\n Transition CriteriaMessage: "
            print transition.criteria_message
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::BluePrint::APIException
          exception = response_handler
          # Get the Code
          print "\n code:"
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

  def self.update_blueprint(module_api_name, record_id, transition_id)
    # """
    # This method is used to update a single record's Blueprint details with ID and print the response.
    # :param module_api_name: The API Name of the record's module
    # :param record_id: The ID of the record to update Blueprint
    # :param transition_id: The ID of the Blueprint transition Id
    # """

    # """
    # example
    # module_api_name = "Leads"
    # record_id = "34096432469044"
    # transition_id = '34096431172075'
    # """
    # Get instance of BluePrintOperations Class that takes module_api_name and record_id as parameter
    bpo = ZOHOCRMSDK::BluePrint::BluePrintOperations.new(record_id, module_api_name)
    # Get instance of BodyWrapper Class that will contain the request body
    bw = ZOHOCRMSDK::BluePrint::BodyWrapper.new
    # Get instance of BluePrint Class
    blue_print = ZOHOCRMSDK::BluePrint::BluePrint.new
    # Set transitionId to the BluePrint instance
    blue_print.transition_id = transition_id
    # Get instance of Record Class
    data = ZOHOCRMSDK::Record::Record.new
    data.add_key_value('Phone', '8940372937')
    data.add_key_value('Notes', 'Updated via blueprint')
    # Set data to the BluePrint instance
    blue_print.data = data
    # List to contain BluePrint instances
    # Add BluePrint instance to the list
    blue_print_list = [blue_print]
    # Set the list to bluePrint in BodyWrapper instance
    bw.blueprint = blue_print_list
    # Call updateBluePrint method that takes BodyWrapper instance as parameter
    response = bpo.update_blueprint(bw)

    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_response = response.data_object
        # Check if SuccessResponse instance is received.
        if action_response.is_a? ZOHOCRMSDK::BluePrint::SuccessResponse
          success_response = action_response
          # Get the Code
          print "\n code:"
          print success_response.code.value
          # Get the Status
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
        # Check if APIException instance is received.
        elsif action_response.is_a? ZOHOCRMSDK::BluePrint::APIException
          api_exception = action_response
          # Get the Code
          print "\n code:"
          print api_exception.code.value
          # Get the Status
          print "\n status:"
          # Get the message
          print api_exception.status.value
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
  def self.print_pick_list_value(pick_list_value)
    # Get the DisplayValue of each PickListValue
    print "\n DisplayValue:"
    print pick_list_value.display_value
    # Get the SequenceNumber of each PickListValue
    print "\n SequenceNumber:"
    print pick_list_value.sequence_number
    # Get the ExpectedDataType of each PickListValue
    print "\n ExpectedDataType:"
    print pick_list_value.expected_data_type
    # Get the ActualValue of each PickListValue
    print "\n ActualValue :"
    print pick_list_value.actual_value
    pick_list_value.maps.each do |map|
      # Get each value from the map
      print "\n"
      print map
      pick_list_values = map.pick_list_values
      unless pick_list_values.nil?
        pick_list_values.each do |plv|
          print_pick_list_value(plv)
        end
      end
    end
    # Get the SysRefName of each PickListValues
    print "\nField PickListValue SysRefName: "
    print pick_list_value.sys_ref_name
    # Get the Type of each PickListValues
    print "\nField PickListValue Type: "
    print pick_list_value.type
  end
end
