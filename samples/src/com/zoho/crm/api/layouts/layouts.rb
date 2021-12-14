require 'ZOHOCRMSDK2_1'

class Layout
  def self.get_layouts(module_api_name)
    # """
    # This method is used to get metadata about all the layouts of a module and print the response.
    # :param module_api_name: The API Name of the module to get layouts.
    # """

    # """
    # example
    # module_api_name = "Leads";
    # """
    # Get instance of LayoutsOperations Class that takes module_api_name as parameter
    lo = ZOHOCRMSDK::Layouts::LayoutsOperations.new(module_api_name)
    # Call get_layouts method
    response = lo.get_layouts
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received.
        if response_handler.is_a? ZOHOCRMSDK::Layouts::ResponseWrapper
          # Get the list of obtained Layout instances
          layouts = response_handler.layouts
          layouts.each do |layout|
            # Get the CreatedTime of each Layout
            unless layout.created_time.nil?
              print "\nLayout CreatedTime: "
              print layout.created_time
            end
            # Check if ConvertMapping is not None
            # Get the ConvertMapping map
            layout.convert_mapping&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            # Get the ModifiedTime of each Layout
            print "\nLayout ModifiedTime: "
            print layout.modified_time
            # Get the Visibility of each Layout
            print "\nLayout Visible: "
            print layout.visible
            # Get the createdFor User instance of each Layout
            created_for = layout.created_for
            unless created_for.nil?
              # Get the Name of the created_for User
              print "\n Layout CreatedFor User-Name:"
              print created_for.name.to_s
              # Get the ID of the created_for User
              print "\n Layout CreatedFor User-ID:"
              print created_for.id.to_s
              # Get the Email of the created_for User
            end
            # Get the Name of each Layout
            print "\nLayout Name: "
            print layout.name
            # Get the modifiedBy User instance of each Layout
            modified_by = layout.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Layout ModifiedBy User-Name:"
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Layout ModifiedBy User-ID:"
              print modified_by.id.to_s
            end
            # Check if profiles is not null
            profiles = layout.profiles
            # Check if profiles is not null
            # Get the Default of each Profile
            # Get the Name of each Profile
            # Get the ID of each Profile
            profiles&.each do |profile|
              # Get the Default of each Profile
              print "\n Layout Profile Default:"
              print profile.default
              # Get the Name of each Profile
              print "\n Layout Profile Name: "
              print profile.name
              # Get the ID of each Profile
              print "\n Layout Profile ID: "
              print profile.id.to_s
              print "\n"
              defaultview = profile.defaultview
              unless defaultview.nil?
                print "Layout Profile DefaultView Name:"
                print defaultview.name
                print "Layout Profile DefaultView ID:"
                print defaultview.id
                print "Layout Profile DefaultView Type:"
                print defaultview.type
              end
            end
            # Get the Layout ID of each Layout
            print "\nLayout ID:  "
            print layout.id.to_s
            # Get the Layout Status of each Layout
            print "\nLayout status: "
            print layout.status
            # Get the modifiedBy User instance of each Layout
            created_by = layout.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Layout Created User-Name:"
              print created_by.name
              # Get the ID of the created_by User
              print "\n Layout Created User-ID:"
              print created_by.id
            end
            # Get the sections of each Layout
            sections = layout.sections
           
            sections&.each do |section|
              # Get the DisplayLabel of each Section
              print "\n Layout Section DisplayLabel:"
              print section.display_label
              # Get the SequenceNumber of each Section
              print "\n Layout Section Sequence Number:"
              print section.sequence_number
              # Get the Issubformsection of each Section
              print "\n Layout Section Issubformsection:"
              print section.issubformsection
              # Get the TabTraversal of each Section
              print "\n Layout Section TabTraversal:"
              print section.tab_traversal
              # Get the APIName of each Section
              print "\n Layout Section APIName:"
              print section.api_name
              # Get the ColumnCount of each Section
              print "\n Layout Section ColumnCount:"
              print section.column_count
              # Get the Name of each Section
              print "\n Layout Section Name:"
              print section.name
              print "\n Section type:"
              print section.type
              # Get the GeneratedType of each Section
              print "\n Layout Section GeneratedType:"
              print section.generated_type
              # Get the fields of each Section
              fields = section.fields
              # Check if fields is not None
              fields&.each do |field|
                print_field(field)
              end
              # Get the display type of each Layout
              print "\nLayout display type : :  "
              print layout.display_type
              # Get the business card  of each Layout
              print "\nLayout buisness card:: "
              print layout.show_business_card
             
              # Get the properties instance of each Section
              properties = section.properties
              # Check if properties is not null
              unless properties.nil?
                # Get the ReorderRows of Properties
                print "\n Layout Section Properties ReorderRows: "
                print properties.reorder_rows
                # Get the tooltip instance of the Properties
                tooltip = properties.tooltip
                # Check if tooltip is not None
                unless tooltip.nil?
                  # Get the Name of the ToolTip
                  print "\n Layout Section Properties ToolTip Name: "
                  print tooltip.name
                  # Get the Value of the ToolTip
                  print "\n Layout Section Properties ToolTip Value: "
                  print tooltip.value
                end
                # Get the MaximumRows of each Properties
                print "\nLayout Section Properties MaximumRows: "
                print properties.maximum_rows
              end
            end
            print "\nLayout Id: "
            print layout.id.to_s
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Layouts::APIException
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

  def self.get_layout(module_api_name, layout_id)
    # """
    # This method is used to get metadata about a single layout of a module with layoutID and print the response.
    # :param module_api_name: The API Name of the layout's module
    # :param layout_id: The ID of the layout to be obtained
    # """

    # """
    # example
    # module_api_name = "Leads"
    # layout_id = "34770610091055"
    # """
    # Get instance of LayoutsOperations Class that takes module_api_name as parameter
    lo = ZOHOCRMSDK::Layouts::LayoutsOperations.new(module_api_name)
    # Call get_layout method that takes layout_id as parameter
    response = lo.get_layout(layout_id)
    unless response.nil?
      # Get the status code from response
      status_code = response.status_code
      print "\n Status Code :" + status_code.to_s
      if [204, 304].include? status_code
        print(status_code == 204 ? 'No Content' : 'Not Modified')
        return
      end
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        response_handler = response.data_object
        # Check if expected ResponseWrapper instance is received.
        if response_handler.is_a? ZOHOCRMSDK::Layouts::ResponseWrapper
          # Get the list of obtained Layout instances
          layouts = response_handler.layouts
          layouts.each do |layout|
            # Get the CreatedTime of each Layout
            unless layout.created_time.nil?
              print "\nLayout CreatedTime: "
              print layout.created_time
            end
            # Check if ConvertMapping is not None
            # Get the ConvertMapping map
            layout.convert_mapping&.each do |k, v|
              print "\n"
              print k
              print v
              print "\n"
            end
            # Get the ModifiedTime of each Layout
            print "\nLayout ModifiedTime: "
            print layout.modified_time
            # Get the Visibility of each Layout
            print "\nLayout Visible: "
            print layout.visible
            # Get the createdFor User instance of each Layout
            created_for = layout.created_for
            unless created_for.nil?
              # Get the Name of the created_for User
              print "\n Layout CreatedFor User-Name:"
              print created_for.name.to_s
              # Get the ID of the created_for User
              print "\n Layout CreatedFor User-ID:"
              print created_for.id.to_s
              # Get the Email of the created_for User
            end
            # Get the Name of each Layout
            print "\nLayout Name: "
            print layout.name
            # Get the modifiedBy User instance of each Layout
            modified_by = layout.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modified_by User
              print "\n Layout ModifiedBy User-Name:"
              print modified_by.name
              # Get the ID of the modified_by User
              print "\n Layout ModifiedBy User-ID:"
              print modified_by.id.to_s
            end
            # Check if profiles is not null
            profiles = layout.profiles
            # Check if profiles is not null
            # Get the Default of each Profile
            # Get the Name of each Profile
            # Get the ID of each Profile
            profiles&.each do |profile|
              # Get the Default of each Profile
              print "\n Layout Profile Default:"
              print profile.default
              # Get the Name of each Profile
              print "\n Layout Profile Name: "
              print profile.name
              # Get the ID of each Profile
              print "\n Layout Profile ID: "
              print profile.id.to_s
              print "\n"
              defaultview = profile.defaultview
              unless defaultview.nil?
                print "Layout Profile DefaultView Name:"
                print defaultview.name
                print "Layout Profile DefaultView ID:"
                print defaultview.id
                print "Layout Profile DefaultView Type:"
                print defaultview.type
              end
            end
            # Get the Layout ID of each Layout
            print "\nLayout ID:  "
            print layout.id.to_s
            # Get the Layout Status of each Layout
            print "\nLayout status: "
            print layout.status
             # Get the display type of each Layout
            print "\nLayout display type : :  "
            print layout.display_type
            # Get the business card  of each Layout
            print "\nLayout buisness card:: "
            print layout.show_business_card
            # Get the modifiedBy User instance of each Layout
            created_by = layout.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Layout Created User-Name:"
              print created_by.name
              # Get the ID of the created_by User
              print "\n Layout Created User-ID:"
              print created_by.id
            end
            # Get the sections of each Layout
            sections = layout.sections
          
            sections&.each do |section|
              # Get the DisplayLabel of each Section
              print "\n Layout Section DisplayLabel:"
              print section.display_label
              # Get the SequenceNumber of each Section
              print "\n Layout Section Sequence Number:"
              print section.sequence_number
              # Get the Issubformsection of each Section
              print "\n Layout Section Issubformsection:"
              print section.issubformsection
              # Get the TabTraversal of each Section
              print "\n Layout Section TabTraversal:"
              print section.tab_traversal
              # Get the APIName of each Section
              print "\n Layout Section APIName:"
              print section.api_name
              # Get the ColumnCount of each Section
              print "\n Layout Section ColumnCount:"
              print section.column_count
              # Get the Name of each Section
              print "\n Layout Section Name:"
              print section.name
              # Get the GeneratedType of each Section
              print "\n Layout Section GeneratedType:"
              print section.generated_type
              # Get the fields of each Section
              fields = section.fields
              # Check if fields is not None
              fields&.each do |field|
                print_field(field)
              end
              print "\n Section type:"
              print section.type
              # Get the properties instance of each Section
              properties = section.properties
              # Check if properties is not null
              unless properties.nil?
                # Get the ReorderRows of Properties
                print "\n Layout Section Properties ReorderRows: "
                print properties.reorder_rows
                # Get the tooltip instance of the Properties
                tooltip = properties.tooltip
                # Check if tooltip is not None
                unless tooltip.nil?
                  # Get the Name of the ToolTip
                  print "\n Layout Section Properties ToolTip Name: "
                  print tooltip.name
                  # Get the Value of the ToolTip
                  print "\n Layout Section Properties ToolTip Value: "
                  print tooltip.value
                end
                # Get the MaximumRows of each Properties
                print "\nLayout Section Properties MaximumRows: "
                print properties.maximum_rows
              end
            end
            print "\nLayout Id: "
            print layout.id.to_s
            # Get the display type of each Layout
            print "\nLayout display type : :  "
            print layout.display_type
            # Get the business card  of each Layout
            print "\nLayout buisness card:: "
            print layout.show_business_card
            
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::Layouts::APIException
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

  def self.print_field(field)
    print "\n"
    # Get the SystemMandatory of each Field
    print "\nField SystemMandatory: "
    print field.system_mandatory
    # Get the Webhook of each Field
    print "\nField Webhook: "
    print field.webhook
    # Get the JsonType of each Field
    print "\nField JsonType: "
    print field.json_type
    # Get the obtained Crypt instance
    crypt = field.crypt
    unless crypt.nil?
      # Get the Crypt Mode
      print "\nField Crypt Mode:"
      print crypt.mode
      # Get the Crypt Column
      print "\nField Crypt Column:"
      print crypt.column
      # Get the Crypt Table
      print "\nField Crypt Table:"
      print crypt.table
      # Get the Crypt Status
      print "\nField Crypt Status:"
      print crypt.status
      enc_fld_ids = crypt.encfldids
      unless enc_fld_ids.nil?
        print "\nEncFldIds : "
        enc_fld_ids.each do |enc_fld_id|
          print enc_fld_id
        end
      end
      print "\nField Crypt Notify:"
      print crypt.notify
    end
    private_info = field.private
    unless private_info.nil?
      print "\nField Private Type: "
      print private_info.type
      print "\nField Private Export: "
      print private_info.export
      print "\nField Private Restricted: "
      print private_info.restricted
    end
    # Get the FieldLabel of each Field
    print "\n Field FieldLabel: "
    print field.field_label
    # Get the Type of each Field
    print "\n Field Type: "
    print field.type
    external = field.external
    unless external.nil?
      print "\n Get External show "
      print external.show
      print "\n Get External type "
      print external.type
      print "\n Get External config "
      print external.allow_multiple_config
    end
    multiuserlookup = field.multiuserlookup
    unless multiuserlookup.nil?
      print "Get multiuserlookup display label"
      print multiuserlookup.display_label
      print "Get multiuserlookup linking module"
      print multiuserlookup.linking_module
      print "Get multiuserlookup lookup api_name"
      print multiuserlookup.lookup_apiname
      print "Get multiuserlookup api name"
      print multiuserlookup.api_name
      print "Get multiuserlookup id"
      print multiuserlookup.id
      print "Get multiuserlookup connected module"
      print multiuserlookup.connected_module
      print "Get multiuserlookup  connected lookup api name"
      print multiuserlookup.connectedlookup_apiname
    end
    tooltip = field.tooltip
    unless tooltip.nil?
      # Get the Name of the ToolTip
      print "\nField ToolTip Name:: "
      print tooltip.name
      # Get the Value of the ToolTip
      print "\nField ToolTip Value: "
      print tooltip.value
    end
    # Get the CreatedSource of each Field
    print "\nField CreatedSource: "
    print field.created_source
    # Get the FieldReadOnly of each Field
    print "\nField FieldReadOnly: "
    print field.field_read_only
    # Get the DisplayLabel of each Field
    print "\nField DisplayLabel: "
    print field.display_label
    # Get the ReadOnly of each Field
    print "\nField ReadOnly: "
    print field.read_only
    # Get the Filterable of each Field
    print "\nField Filterable: "
    print field.filterable
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
    # Get the QuickSequenceNumber of each Field
    unless field.quick_sequence_number.nil?
      print "\nField QuickSequenceNumber: "
      print field.quick_sequence_number
    end
    # Get the BusinesscardSupported of each Field
    print "\nField BusinesscardSupported: "
    print field.businesscard_supported
    # Check if MultiModuleLookup is not None
    # Get the MultiModuleLookup dict
    multi_module_lookup = field.multi_module_lookup
    unless multi_module_lookup.nil?
      print  "Lookup name : "
      print multi_module_lookup.name
      print  "Lookup id : "
      print multi_module_lookup.id
      module_1 = multi_module_lookup.module
      unless module_1.nil?
        print  "module name : "
        print module_1.api_name
        print  "module id : "
        print module_1.id
      end
    end
    # Get the obtained Currency instance
    currency = field.currency
    unless currency.nil?
      # Get the RoundingOption of the Currency
      print "\nField Currency RoundingOption: "
      # Get the Precision of the Currency
      print currency.rounding_option
      unless currency.precision.nil?
        print "\nField Currency Precision:"
        print currency.precision
      end
    end
    # Get the ID of each Field
    print "\nField ID: "
    print field.id.to_s
    # Get if the Field is a CustomField
    unless field.custom_field
      print "\nField CustomField:"
      print field.custom_field
    end
    lookup = field.lookup
    unless lookup.nil?
      # Get the obtained Layout instance
      layout = lookup.layout
      # Check if layout is not null
      unless layout.nil?
        # Get the ID of the Layout
        print "\nField ModuleLookup Layout ID: "
        print layout.id.to_s
        # Get the Name of the Layout
        print "\nField ModuleLookup Layout Name: "
        print layout.name
      end
      # Get the DisplayLabel of the Module
      print "\nField ModuleLookup DisplayLabel: "
      print lookup.display_label
      # Get the APIName of the Module
      print "\nField ModuleLookup APIName: "
      print lookup.api_name
      # Get the Module of the ModuleLookup
      print "\nield ModuleLookup Module:  "
      print lookup.module
      unless lookup.id.nil?
        # Get the ID of the Module
        print "\nField ModuleLookup ID:"
      end
    end
    unless field.visible.nil?
      # Get the Visible of each Field'
      print "\nField Visible: "
      print field.visible
    end
    unless field.pick_list_values_sorted_lexically.nil?
      # Get the pick list values lexically sorted of each Field'
      print "\nField pick list values lexically sorted: "
      print field.pick_list_values_sorted_lexically
    end
    unless field.sortable.nil?
      # Get the sortable of each Field'
      print "\nField sortable: "
      print field.sortable
    end
    unless field.ui_type.nil?
      # Get the ui type of each Field'
      print "\nField ui type: "
      print field.ui_type
    end
    unless field.sequence_number.nil?
      # Get the sequence number of each Field'
      print "\nField sequence number: "
      print field.sequence_number
    end
    field_profiles = field.profiles
    unless field_profiles.nil?
      field_profiles.each do |field_profile|
        print "Profile permission Type "
        print field_profile.permission_type
        print "Profile Name "
        print field_profile.name
        print "Profile ID "
        print field_profile.id
      end
    end
    unless field.length.nil?
      # Get the Length of each Field
      print "\nField Length: "
      print field.length
    end
    view_type = field.view_type
    unless view_type.nil?
      # Get the View of the ViewType
      print "\nField ViewType View: "
      print view_type.view
      # Get the Edit of the ViewType
      print "\nField ViewType Edit: "
      print view_type.edit
      # Get the Create of the ViewType
      print "\nField ViewType Create: "
      print view_type.create
      # Get the QuickCreate of the ViewType
      print "\nField ViewType QuickCreate: "
      print view_type.quick_create
    end
    subform = field.subform
    unless subform.nil?
      # Get the obtained Layout instance
      layout = subform.layout
      # Check if layout is not null
      unless layout.nil?
        # Get the ID of the Layout
        print "\nField Subform Layout ID: "
        print layout.id.to_s
        # Get the ID of the Layout
        print "\nField Subform Layout Name: "
        print layout.name
      end
      # Get the DisplayLabel of the Module
      print "\nField Subform DisplayLabel: "
      print subform.display_label
      # Get the APIName of the Module
      print "\nField Subform APIName: "
      print subform.api_name
      # Get the Module of the ModuleLookup
      print "\nField Subform Module: "
      print subform.module
      unless subform.id.nil?
        # Get the ID of the Module
        print "\nField Subform ID: "
        print subform.id.to_s
      end
    end
    # Get the APIName of each Field
    print "\nField APIName: "
    print field.api_name
    # Get the obtained Unique instance
    unique = field.unique
    unless unique.nil?
      # Get the Casesensitive of the Unique
      print "\nField Unique Casesensitive : "
      print unique.casesensitive
    end
    unless field.history_tracking.nil?
      # Get the HistoryTracking of each Field
      history_tracking = field.history_tracking
      module_1 = history_tracking.module
      unless module_1.nil?
        module_layout = module_1.layout
        unless module_layout.nil?
          print "Module layout id"
          print module_layout.id
        end
        print "Module layout display label"
        print module_1.display_label
        print "Module layout api name"
        print module_1.api_name
        print "Module layout id"
        print module_1.id
        print "Module layout module"
        print module_1.module
        print "Module layout module name"
        print module_1.module_name
      end
      duration_configured = field.history_tracking.duration_configured_field
      unless duration_configured.nil?
        print "historytracking duration configured field"
        print duration_configured.id
      end
    end
    # Get the DataType of each Field
    print "\nField DataType: "
    print field.data_type
    # Get the Object obtained Formula instance
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
    # Get the MassUpdate of each Field
    print "\nField MassUpdate: "
    print field.mass_update
    unless field.blueprint_supported.nil?
      # Get the BlueprintSupported of each Field
      print "\nField BlueprintSupported: "
      print field.blueprint_supported
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
      # Get the  connected module: of the MultiSelectLookup
      print "\n  connected module::"
      print multi_select_lookup.connected_module
      # Get the ID of the MultiSelectLookup
      print "\n ID:"
      print multi_select_lookup.id.to_s
    end
    pick_list_values = field.pick_list_values
    # Get the DisplayValue of each PickListValue
    # Get the SequenceNumber of each PickListValue
    # Get the ExpectedDataType of each PickListValue
    # Get the ActualValue of each PickListValue
    # Get the SysRefName of each PickListValues
    # Get the Type of each PickListValues
    pick_list_values&.each do |pick_list_value|
      print_pick_list_value(pick_list_value)
     
    end
    # Check if autoNumber is not None
    auto_number = field.auto_number
    unless auto_number.nil?
      # Get the Prefix of the AutoNumber
      print "\nField AutoNumber Prefix: "
      print auto_number.prefix
      # Get the Suffix of the AutoNumber
      print "\nField AutoNumber Suffix: "
      print auto_number.suffix
      # Get the StartNumber of the AutoNumber
      unless auto_number.start_number.nil?
        print "\nField AutoNumber StartNumber: "
        print auto_number.start_number
      end
    end
    default_value = field.default_value
    unless default_value.nil?
      # Get the DefaultValue of each Field
      print "\nField DefaultValue"
      print default_value
    end
    
    display_type = field.display_type
    unless display_type.nil?
      # Get the display type of each Field
      print "\nField display type: "
      print display_type
    end
    # Check if ValidationRule is not None
    validation_rule = field.validation_rule
    # Get the validationRule dict
    validation_rule&.each do |k, v|
      print "\n"
      print k
      print v
      print "\n"
    end
    # Check if ConvertMapping is not None
    # Get the validationRule dict
    field.convert_mapping&.each do |k, v|
      print "\n"
      print k
      print v
      print "\n"
    end
  end

  def self.print_pick_list_value(pick_list_value)
    # Get the ID of each PickListValue
    print "\nField PickListValue ID: "
    print pick_list_value.id
    # Get the DisplayValue of each PickListValue
    print "\nField PickListValue DisplayValue: "
    print pick_list_value.display_value
    # Get the SequenceNumber of each PickListValue
    print "\nField PickListValue SequenceNumber:: "
    print pick_list_value.sequence_number unless pick_list_value.sequence_number.nil?
    # Get the ExpectedDataType of each PickListValue
    print "\nField PickListValue ExpectedDataType: "
    print pick_list_value.expected_data_type
    unless pick_list_value.maps.nil?
      pick_list_value.maps.each do |map|
        print "\nField PickListValue Maps APIName: "
        print map.api_name
        pick_list_values = map.pick_list_values
        print pick_list_values
        pick_list_values.each do |pick_list_value1|
          print_pick_list_value(pick_list_value1)
        end
      end
    end
    # Get the ActualValue of each PickListValue
    print "\nField PickListValue ActualValue: "
    print pick_list_value.actual_value
    # Get the SysRefName of each PickListValues
    print "\nField PickListValue SysRefName: "
    print pick_list_value.sys_ref_name
    # Get the Type of each PickListValues
    print "\nField PickListValue Type: "
    print pick_list_value.type
  end
end
