require 'ZCRMSDK'

class Module
  def self.get_modules
    # """
    # This method is used to get metadata about all the modules and print the response.
    # """
    # Get instance of ModulesOperations Class
    mo = Modules::ModulesOperations.new
    # Get instance of HeaderMap Class
    hm = HeaderMap.new
    # Call get_modules method that takes header_instance as parameter
    response = mo.get_modules(hm)
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
        if response_handler.is_a? Modules::ResponseWrapper
          # Get the list of obtained Module instances
          modules = response_handler.modules
          modules.each do |module_ins|
            # Get the Name of each Module
            print "\n Module Name: "
            print module_ins.name
            # Get the GlobalSearchSupported of each Module
            print "\n Module GlobalSearchSupported: "
            print module_ins.global_search_supported
            # Get the blueprintsupported of each Module
            print "\n Module blueprintsupported: "
            print module_ins.isblueprintsupported
            # Get the Visible of each Module
            print "\n Module Visible: "
            print module_ins.visible
            on_demand_propertiers= module_ins.on_demand_properties
            unless on_demand_propertiers.nil?
              on_demand_propertiers.each do|on_demand_propertier|
                print "\n Module onDemandProperties Fields: " 
                print on_demand_propertier
              end
            end
            # Get the Deletable of each Module
            print "\n Module Deletable: "
            print module_ins.deletable
            # Get the Description of each Module
            print "\n Module Description: "
            print module_ins.description
            # Get the Creatable of each Module
            print "\n Module Creatable: "
            print module_ins.creatable
            # Get the InventoryTemplateSupported of each Module
            print "\n Module InventoryTemplateSupported: "
            print module_ins.inventory_template_supported
            # Get the ModifiedTime of each Module
            unless module_ins.modified_time.nil?
              print "\n Module ModifiedTime: "
              print module_ins.modified_time
            end
            # Get the PluralLabel of each Module
            print "\n Module PluralLabel: "
            print module_ins.plural_label
            # Get the PresenceSubMenu of each Module
            print "\n Module PresenceSubMenu: "
            print module_ins.presence_sub_menu
            # Get the TriggersSupported of each Module
            print "\n Module TriggersSupported: "
            print module_ins.triggers_supported
            # Get the ID of each module
            print "\n Module Id: "
            print module_ins.id.to_s
            # Get the Visibility of each Module
            print "\n Module Visibility: "
            print module_ins.visibility
            # Get the Convertable of each Module
            print "\n Module Convertable: "
            print module_ins.convertable
            # Get the Editable of each Module
            print "\n Module Editable: "
            print module_ins.editable
            # Check if properties is not None
            unless module_ins.properties.nil?
              print module_ins.properties.inspect
              print "\n Module Properties Fields:"
              module_ins.properties.each do |property|
                print property
              end
              print "\n "
            end
            # Get the RelatedListProperties instance of each Module
            related_list_properties = module_ins.related_list_properties
            # Check if relatedListProperties is not None
            unless related_list_properties.nil?
              # Get the SortBy of RelatedListProperties
              print "\n Module RelatedListProperties SortBy: "
              print related_list_properties.sort_by
              # Get List of fields APIName
              fields = related_list_properties.fields
              # Check if fields is not None
              fields&.each do |field_name|
                print "\n Module RelatedListProperties Fields: "
                print field_name
              end
              # Get the SortOrder of RelatedListProperties
              print "\n Module RelatedListProperties SortOrder: "
              print related_list_properties.sort_order
            end
            print "\n Module EmailtemplateSupport: "
            print module_ins.emailtemplate_support
            # Get the list of Profile instance of each Module
            profiles = module_ins.profiles
            # Check if profiles is not null
            # Get the Name of each Profile
            # Get the Id of each Profile
            profiles&.each do |profile|
              # Get the Name of each Profile
              print "\n Module Profile Name: "
              print profile.name
              # Get the Id of each Profile
              print "\n Module Profile Id: "
              print profile.id.to_s
            end
            # Get the FilterStatus of each Module
            print "\n Module FilterSupported: "
            print module_ins.filter_supported
            # Get the DisplayField of each Module
            print "\n Module DisplayField: "
            print module_ins.display_field
            # Get List of SearchLayoutFields APIName
            search_layout_fields = module_ins.search_layout_fields
            search_layout_fields&.each do |search_layout_field|
              print "\n Module SearchLayoutFields Fields: "
              print search_layout_field
            end
            # Get the KanbanView of each Module
            print "\n Module KanbanViewSupported: "
            print module_ins.kanban_view_supported
            # Get the KanbanViewSupported of each Module
            unless module_ins.kanban_view.nil?
              print "\n Module KanbanView: "
              print module_ins.kanban_view
            end
            # Get the ShowAsTab of each Module
            print "\n Module ShowAsTab: "
            print module_ins.show_as_tab
            # Get the PerPage of each Module
            print "\n Module PerPage: "
            print module_ins.per_page
            # Get the WebLink of each Module
            print "\n Module WebLink: "
            print module_ins.web_link
            # Get the SequenceNumber of each Modul
            print "\n Module SequenceNumber: "
            print module_ins.sequence_number
            # Get the SingularLabel of each Module
            print "\n Module SingularLabel: "
            print module_ins.singular_label
            # Get the Viewable of each Module
            print "\n Module Viewable: "
            print module_ins.viewable
            # Get the APISupported of each Module
            print "\n Module APISupported: "
            print module_ins.api_supported
            # Get the API Name of each module
            print "\n Module APIName: "
            print module_ins.api_name
            # Get the QuickCreate of each Module
            print "\n Module QuickCreate: "
            print module_ins.quick_create
            modified_by = module_ins.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the ID of the modifiedBy User
              print "\n Module ModifiedBy User-Name:"
              print modified_by.id.to_s
              # Get the name of the modifiedBy User
              print "\n Module ModifiedBy User-ID:"
              print modified_by.name
            end
            # Get the GeneratedType of each Module
            print "\n Module GeneratedType: "
            print module_ins.generated_type
            # Get the FeedsRequired of each Module
            print "\n Module FeedsRequired: "
            print module_ins.feeds_required
            # Get the ScoringSupported of each Module
            print "\n Module ScoringSupported: "
            print module_ins.scoring_supported
            # Get the WebformSupported of each Module
            print "\n Module WebformSupported: "
            print module_ins.webform_supported
            # Get the list of Argument instance of each Module
            arguments = module_ins.arguments
            # Check if arguments is not None
            # Get the Name of each Argument
            # Get the Value of each Argument
            arguments&.each do |argument|
              # Get the Name of each Argument
              print "\n Module Argument Name: "
              print argument.name
              # Get the Value of each Argument
              print "\n Module Argument Value: "
              print argument.value
            end
            print "\n Module ModuleName: "
            print module_ins.module_name
            # Get the BusinessCardFieldLimit of each Module
            print "\n Module business_card_field_limit=:  "
            print module_ins.business_card_field_limit
            # Get the parentModule Module instance of each Module
            parent_module = module_ins.parent_module
            # Check if parentModule is not null
            if !parent_module.nil? && !parent_module.api_name.nil?
              # Get the ID of Parent Module
              print "\n Module Parent Module Name: "
              print module_ins.api_name
              # Get the Name of Parent Module
              print "\n Module Parent Module Id: "
              print module_ins.id.to_s
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Modules::APIException
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

  def self.get_module(module_api_name)
    # """
    # This method is used to get metadata about single module with it's API Name and print the response.
    # :param module_api_name: The API Name of the module to obtain metadata
    # """

    # """
    # example
    # module_api_name = "Leads";
    # """
    # Get instance of ModulesOperations Class
    mo = Modules::ModulesOperations.new
    # Call get_module method that takes module_api_name as parameter
    response = mo.get_module(module_api_name)
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
        if response_handler.is_a? Modules::ResponseWrapper
          # Get the list of obtained Module instances
          modules = response_handler.modules
          modules.each do |module_ins|
            # Get the Name of each Module
            print "\n Module Name: "
            print module_ins.name
            # Get the GlobalSearchSupported of each Module
            print "\n Module GlobalSearchSupported: "
            print module_ins.global_search_supported
            # Get the blueprintsupported of each Module
            print "\n Module blueprintsupported: "
            print module_ins.isblueprintsupported
            # Get the Visible of each Module
            print "\n Module Visible: "
            print module_ins.visible
            on_demand_properties= module_ins.on_demand_properties
            unless on_demand_properties.nil?
             
              on_demand_properties.each do|on_demand_property|
                print "\n Module onDemandProperties Fields: " 
                print on_demand_property
              end
            end
            # Get the Deletable of each Module
            print "\n Module Deletable: "
            print module_ins.deletable
            # Get the Description of each Module
            print "\n Module Description: "
            print module_ins.description
            # Get the Creatable of each Module
            print "\n Module Creatable: "
            print module_ins.creatable
            # Get the InventoryTemplateSupported of each Module
            print "\n Module InventoryTemplateSupported: "
            print module_ins.inventory_template_supported
            # Get the ModifiedTime of each Module
            unless module_ins.modified_time.nil?
              print "\n Module ModifiedTime: "
              print module_ins.modified_time
            end
            # Get the PluralLabel of each Module
            print "\n Module PluralLabel: "
            print module_ins.plural_label
            # Get the PresenceSubMenu of each Module
            print "\n Module PresenceSubMenu: "
            print module_ins.presence_sub_menu
            # Get the TriggersSupported of each Module
            print "\n Module TriggersSupported: "
            print module_ins.triggers_supported
            # Get the ID of each module
            print "\n Module Id: "
            print module_ins.id.to_s
            # Get the Visibility of each Module
            print "\n Module Visibility: "
            print module_ins.visibility
            # Get the Convertable of each Module
            print "\n Module Convertable: "
            print module_ins.convertable
            # Get the Editable of each Module
            print "\n Module Editable: "
            print module_ins.editable
            # Check if properties is not None
            unless module_ins.properties.nil?
              print "\n Module Properties Fields:"
              module_ins.properties.each do |property|
                print property
              end
              print "\n "
            end
            # Get the RelatedListProperties instance of each Module
            related_list_properties = module_ins.related_list_properties
            # Check if relatedListProperties is not None
            unless related_list_properties.nil?
              # Get the SortBy of RelatedListProperties
              print "\n Module RelatedListProperties SortBy: "
              print related_list_properties.sort_by
              # Get List of fields APIName
              fields = related_list_properties.fields
              # Check if fields is not None
              fields&.each do |field_name|
                print "\n Module RelatedListProperties Fields: "
                print field_name
              end
              # Get the SortOrder of RelatedListProperties
              print "\n Module RelatedListProperties SortOrder: "
              print related_list_properties.sort_order
            end
            print "\n Module EmailtemplateSupport: "
            print module_ins.emailtemplate_support
            # Get the list of Profile instance of each Module
            profiles = module_ins.profiles
            # Check if profiles is not null
            # Get the Name of each Profile
            # Get the Id of each Profile
            profiles&.each do |profile|
              # Get the Name of each Profile
              print "\n Module Profile Name: "
              print profile.name
              # Get the Id of each Profile
              print "\n Module Profile Id: "
              print profile.id.to_s
            end
            # Get the FilterStatus of each Module
            print "\n Module FilterSupported: "
            print module_ins.filter_supported
            # Get the DisplayField of each Module
            print "\n Module DisplayField: "
            print module_ins.display_field
            # Get List of SearchLayoutFields APIName
            search_layout_fields = module_ins.search_layout_fields
            search_layout_fields&.each do |search_layout_field|
              print "\n Module SearchLayoutFields Fields: "
              print search_layout_field
            end
            # Get the KanbanView of each Module
            print "\n Module KanbanViewSupported: "
            print module_ins.kanban_view_supported
            # Get the KanbanViewSupported of each Module
            unless module_ins.kanban_view.nil?
              print "\n Module KanbanView: "
              print module_ins.kanban_view
            end
            # Get the ShowAsTab of each Module
            print "\n Module ShowAsTab: "
            print module_ins.show_as_tab
            # Get the PerPage of each Module
            print "\n Module PerPage: "
            print module_ins.per_page
            # Get the WebLink of each Module
            print "\n Module WebLink: "
            print module_ins.web_link
            # Get the SequenceNumber of each Modul
            print "\n Module SequenceNumber: "
            print module_ins.sequence_number
            # Get the SingularLabel of each Module
            print "\n Module SingularLabel: "
            print module_ins.singular_label
            # Get the Viewable of each Module
            print "\n Module Viewable: "
            print module_ins.viewable
            # Get the APISupported of each Module
            print "\n Module APISupported: "
            print module_ins.api_supported
            # Get the API Name of each module
            print "\n Module APIName: "
            print module_ins.api_name
            # Get the QuickCreate of each Module
            print "\n Module QuickCreate: "
            print module_ins.quick_create
            modified_by = module_ins.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the ID of the modifiedBy User
              print "\n Module ModifiedBy User-Name:"
              print modified_by.id.to_s
              # Get the name of the modifiedBy User
              print "\n Module ModifiedBy User-ID:"
              print modified_by.name
            end
            # Get the GeneratedType of each Module
            print "\n Module GeneratedType: "
            print module_ins.generated_type
            # Get the FeedsRequired of each Module
            print "\n Module FeedsRequired: "
            print module_ins.feeds_required
            # Get the ScoringSupported of each Module
            print "\n Module ScoringSupported: "
            print module_ins.scoring_supported
            # Get the WebformSupported of each Module
            print "\n Module WebformSupported: "
            print module_ins.webform_supported
            # Get the list of Argument instance of each Module
            arguments = module_ins.arguments
            # Check if arguments is not None
            # Get the Name of each Argument
            # Get the Value of each Argument
            arguments&.each do |argument|
              # Get the Name of each Argument
              print "\n Module Argument Name: "
              print argument.name
              # Get the Value of each Argument
              print "\n Module Argument Value: "
              print argument.value
            end
            print "\n Module ModuleName: "
            print module_ins.module_name
            # Get the BusinessCardFieldLimit of each Module
            print "\n Module business_card_field_limit=:  "
            print module_ins.business_card_field_limit
            # Get the parentModule Module instance of each Module
            parent_module = module_ins.parent_module
            # Check if parentModule is not null
            if !parent_module.nil? && !parent_module.api_name.nil?
              # Get the ID of Parent Module
              print "\n Module Parent Module Name: "
              print module_ins.api_name
              # Get the Name of Parent Module
              print "\n Module Parent Module Id: "
              print module_ins.id.to_s
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Modules::APIException
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

  def self.print_custom_view(cv)
    # Get the DisplayValue of the CustomView
    print "\n  ModuleCustomView DisplayValue: "
    print cv.display_value
    # Get the System Name of the CustomView
    print "\n  ModuleCustomView SystemName: "
    print cv.system_name
    # Get the default value of the CustomView
    print "\n  ModuleCustomView Default: "
    print cv.default
    # Get the Offline value of the CustomView
    print "\n  ModuleCustomView Offline: "
    print cv.offline
    # Get the SortBy of the CustomView
    print "\n  ModuleCustomView SortBy: "
    print cv.sort_by
    # Get the SystemDefined of the CustomView
    print "\n  ModuleCustomView SystemDefined: "
    print cv.system_defined
    # Get the Name of the CustomView
    print "\n  ModuleCustomView Name: "
    print cv.name
    # Get the ID of the CustomView
    print "\n  ModuleCustomView ID: "
    print cv.id.to_s
    # Get the Category of the CustomView
    print "\n  ModuleCustomView Category: "
    print cv.category
    criteria = cv.criteria
    print_criteria(criteria) unless criteria.nil?
    fields = cv.fields
    fields&.each do |field|
      print field.api_name
    end
    unless cv.favorite.nil?
      print "\n  ModuleCustomView favourite: "
      print cv.favorite
    end
    unless cv.sort_order.nil?
      print "\n  ModuleCustomView Sort order: "
      print cv.sort_order
    end
    cv.fields&.each do |field|
      print field
    end
  end

  def self.print_criteria(criteria)
    unless criteria.comparator.nil?
      # Get the Comparator of the Criteria
      print "\n ModuleCustomView Criteria Comparator:"
      print criteria.comparator.value
    end
    field = criteria.field
    unless field.nil?
      print "\n CustomView Criteria Field: "
      print field.api_name
      print "\n CustomView Criteria Field ID: "
      print field.id
    end
    unless criteria.value.nil?
      # Get the Value of the Criteria
      print "\n ModuleCustomView Criteria Value::"
      print criteria.value
    end
    # Get the Field of the Criteria
    print "\n ModuleCustomView Criteria field:"
    print criteria.field
    # Get the List of Criteria instance of each Criteria
    criteria_group = criteria.group
    criteria_group&.each do |criteria|
      print_criteria(criteria)
    end
    unless criteria.group_operator.nil?
      # Get the Group Operator of the Criteria
      print "\n ModuleCustomView Criteria Group Operator: "
      print criteria.group_operator.value
    end
  end

  def self.update_module_by_api_name(module_api_name)
    # """
    # This method is used to update module details using module APIName and print the response.
    # :param module_api_name: The API Name of the module to update
    # """

    # """
    # example
    # module_api_name = "Leads";
    # """
    # Get instance of ModulesOperations Class
    mo = Modules::ModulesOperations.new
    # Get instance of Profile Class
    profile = Profiles::Profile.new
    profile.delete = true
    # To set the Profile Id
    profile.id = 3_477_061_000_000_026_014
    # Add Profile instance to the list
    profiles = [profile]
    # Get instance of Module Class
    module_ins = Modules::Module.new
    module_ins.api_name = 'apiName1'
    # Set the list to profiles in Module instance
    module_ins.profiles = profiles
    # Add the Module instance to list
    modules = [module_ins]
    # Get instance of BodyWrapper Class which contains the request body
    request = Modules::BodyWrapper.new
    # Set the list to modules in BodyWrapper instance
    request.modules = modules
    # Call update_module_by_api_name method that takes BodyWrapper instance and module_api_name as parameter
    response = mo.update_module_by_api_name(module_api_name,request)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Modules::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.modules
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Modules::SuccessResponse
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
            elsif action_response.is_a? Modules::APIException
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
        elsif action_handler.is_a? Modules::APIException
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

  def self.update_module_by_id(module_id)
    # """
    # This method is used to update module details using module Id and print the response.
    # :param module_id: The id of the module to update
    # """

    # """
    # example
    # module_id = 340964300252001
    # """
    # Get instance of ModulesOperations Class
    mo = Modules::ModulesOperations.new
    # Get instance of Profile Class
    profile = Profiles::Profile.new
    profile.delete = true
    # To set the Profile Id
    profile.id = 3_477_061_000_000_026_014
    # Add Profile instance to the list
    profiles = [profile]
    # Get instance of Module Class
    module_ins = Modules::Module.new
    module_ins.api_name = 'apiName2'
    # Set the list to profiles in Module instance
    module_ins.profiles = profiles
    # Add the Module instance to list
    modules = [module_ins]
    # Get instance of BodyWrapper Class which contains the request body
    request = Modules::BodyWrapper.new
    # Set the list to modules in BodyWrapper instance
    request.modules = modules
    # Call update_module_by_id method that takes BodyWrapper instance and module_id as parameter
    response = mo.update_module_by_id(module_id,request)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Modules::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.modules
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Modules::SuccessResponse
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
            elsif action_response.is_a? Modules::APIException
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
        elsif action_handler.is_a? Modules::APIException
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
