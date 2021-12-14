require 'ZOHOCRMSDK2_1'

class Inventory_Templates
  def self.get_inventory_templates()
    # """
    # This method is used to get the Inventory templates data.
    # """

    module_api_name = "Quotes"
    sort_by = ""
    sort_order = ""
    category = ""
    # Get instance of InventoryTemplateOperations Class 

    aro = ZOHOCRMSDK::InventoryTemplates::InventoryTemplatesOperations.new(sort_by,sort_order,category)

    param_instance = ZOHOCRMSDK::ParameterMap.new

    param_instance.add(ZOHOCRMSDK::InventoryTemplates::InventoryTemplatesOperations::GetInventoryTemplatesParam.module_1, module_api_name)

    # Call get_inventory_templates method
    response = aro.get_inventory_templates(param_instance)
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
        if response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::ResponseWrapper
          # Get the list of obtained InventoryTemplate instances
            inventory_templates = response_handler.inventory_templates
            inventory_templates.each do |it|
                # Get the Modified Time of each InventoryTemplate
                print "\nInventoryTemplate Modified Time: "
                print it.modified_time
                # Get the Created Time value of each InventoryTemplate
                print "\nInventoryTemplate Created Time: "
                print it.created_time
                # Get the Module of each InventoryTemplate
                module_1 = it.module
                if !module_1.nil?
                    print "\nInventoryTemplate Module ID: "
                    print module_1.id
                    print "\nInventoryTemplate Module API-Name: "
                    print module_1.name
                end
                # Get the modifiedBy of each InventoryTemplate
                modified_by = it.modified_by
                if !modified_by.nil?
                    print "\nInventoryTemplate modified_by User-ID: "
                    print modified_by.id
                    print "\nInventoryTemplate modified_by User-Name: "
                    print modified_by.name
                    print "\nInventoryTemplate modified_by User-Email: "
                    print modified_by.email
                end
                # Get the createdBy of each InventoryTemplate
                created_by = it.created_by
                if !created_by.nil?
                    print "\nInventoryTemplate created_by User-ID: "
                    print created_by.id
                    print "\nInventoryTemplate created_by User-Name: "
                    print created_by.name
                    print "\nInventoryTemplate created_by User-Email: "
                    print created_by.email
                end
                 # Get the folder of each InventoryTemplate
                 folder = it.folder
                 if !folder.nil?
                     print "\nInventoryTemplate folder ID: "
                     print folder.id
                     print "\nInventoryTemplate folder Name: "
                     print folder.name
                 end
                # Get the Subject of each InventoryTemplate
                print "\nInventoryTemplate Subject: "
                print it.subject
                # Get the Type of each InventoryTemplate
                print "\nInventoryTemplate Type: "
                print it.type
                # Get the Last Usage Time of each InventoryTemplate
                print "\nInventoryTemplate  Last Usage Time: "
                print it.last_usage_time
                # Get the Name of each InventoryTemplate
                print "\nInventoryTemplate Name: "
                print it.name
                # Get the Associated of each InventoryTemplate
                print "\nInventoryTemplate Associated: "
                print it.associated
                # Get the Content of each InventoryTemplate
                print "\nInventoryTemplate Content: "
                print it.content
                # Get the ID of each InventoryTemplate
                print "\nInventoryTemplate ID: "
                print it.id.to_s
                # Get the description of each InventoryTemplate
                print "\nInventoryTemplate description: "
                print it.description
                # Get the EditorMode of each InventoryTemplate
                print "\nInventoryTemplate EditorMode: "
                print it.editor_mode
                # Get the Subject of each InventoryTemplate
                print "\nInventoryTemplate Subject: "
                print it.subject
            end

            info = response_handler.info
            unless info.nil?
              # Get the PerPage from Info
              unless info.per_page.nil?
                print "\n RelatedRecord Info PerPage: "
                print info.per_page
              end
              # Get the Count from Info
              unless info.count.nil?
                print "\n RelatedRecord Info Count:  "
                print info.count
              end
              # Get the Page from Info
              unless info.count.nil?
                print "\n RelatedRecord Info Page: "
                print info.page
              end
              # Get the MoreRecords from Info
              unless info.more_records.nil?
                print "\n RelatedRecord Info more records: "
                print info.more_records
              end
            end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::APIException
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

  def self.get_inventory_template_by_id(inventory_template_id)
    # """
    # This method is used to get the Inventory template data.
    # """

    # Get instance of InventoryTemplateOperations Class 
    aro = ZOHOCRMSDK::InventoryTemplates::InventoryTemplatesOperations.new()

    # Call get_inventory_templates method
    response = aro.get_inventory_template_by_id(inventory_template_id)
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
            if response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::ResponseWrapper
            # Get the list of obtained InventoryTemplate instances
                inventory_templates = response_handler.inventory_templates
                inventory_templates.each do |it|
                    # Get the Modified Time of each InventoryTemplate
                    print "\nInventoryTemplate Modified Time: "
                    print it.modified_time
                    # Get the Created Time value of each InventoryTemplate
                    print "\nInventoryTemplate Created Time: "
                    print it.created_time
                    # Get the Module of each InventoryTemplate
                    module_1 = it.module
                    if !module_1.nil?
                        print "\nInventoryTemplate Module ID: "
                        print module_1.id
                        print "\nInventoryTemplate Module API-Name: "
                        print module_1.name
                    end
                    # Get the modifiedBy of each InventoryTemplate
                    modified_by = it.modified_by
                    if !modified_by.nil?
                        print "\nInventoryTemplate modified_by User-ID: "
                        print modified_by.id
                        print "\nInventoryTemplate modified_by User-Name: "
                        print modified_by.name
                        print "\nInventoryTemplate modified_by User-Email: "
                        print modified_by.email
                    end
                    # Get the createdBy of each InventoryTemplate
                    created_by = it.created_by
                    if !created_by.nil?
                        print "\nInventoryTemplate created_by User-ID: "
                        print created_by.id
                        print "\nInventoryTemplate created_by User-Name: "
                        print created_by.name
                        print "\nInventoryTemplate created_by User-Email: "
                        print created_by.email
                    end
                     # Get the folder of each InventoryTemplate
                     folder = it.folder
                     if !folder.nil?
                         print "\nInventoryTemplate folder ID: "
                         print folder.id
                         print "\nInventoryTemplate folder Name: "
                         print folder.name
                     end
                    # Get the Subject of each InventoryTemplate
                    print "\nInventoryTemplate Subject: "
                    print it.subject
                    # Get the Type of each InventoryTemplate
                    print "\nInventoryTemplate Type: "
                    print it.type
                    # Get the Last Usage Time of each InventoryTemplate
                    print "\nInventoryTemplate  Last Usage Time: "
                    print it.last_usage_time
                    # Get the Name of each InventoryTemplate
                    print "\nInventoryTemplate Name: "
                    print it.name
                    # Get the Associated of each InventoryTemplate
                    print "\nInventoryTemplate Associated: "
                    print it.associated
                    # Get the Content of each InventoryTemplate
                    print "\nInventoryTemplate Content: "
                    print it.content
                    # Get the ID of each InventoryTemplate
                    print "\nInventoryTemplate ID: "
                    print it.id.to_s
                    # Get the description of each InventoryTemplate
                    print "\nInventoryTemplate description: "
                    print it.description
                    # Get the EditorMode of each InventoryTemplate
                    print "\nInventoryTemplate EditorMode: "
                    print it.editor_mode
                    # Get the Subject of each InventoryTemplate
                    print "\nInventoryTemplate Subject: "
                    print it.subject
                end
            # Check if the request returned an exception
            elsif response_handler.is_a? ZOHOCRMSDK::InventoryTemplates::APIException
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
