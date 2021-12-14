require 'ZOHOCRMSDK2_1'

class RelatedList
  def self.get_related_lists(module_api_name)
    # """
    # This method is used to get the related list data of a particular module and print the response.
    # :param module_api_name: The API Name of the module to get related lists
    # """

    # """
    # example
    # module_api_name = "Leads";
    # """

    # Get instance of RelatedListsOperations Class that takes module_api_name as parameter
    rlo = ZOHOCRMSDK::RelatedLists::RelatedListsOperations.new(module_api_name)
    response = rlo.get_related_lists

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
        if response_handler.is_a? ZOHOCRMSDK::RelatedLists::ResponseWrapper
          # Get the list of obtained RelatedList instances
          related_lists = response_handler.related_lists
          related_lists.each do |related_list|
            # Get the SequenceNumber of each RelatedList
            print "\n RelatedList SequenceNumber: "
            print related_list.sequence_number
            # Get the DisplayLabel of each RelatedList
            print "\n RelatedList DisplayLabel: "
            print related_list.display_label
            # Get the APIName of each RelatedList
            print "\n RelatedList APIName: "
            print related_list.api_name
            # Get the Module of each RelatedList
            print "\n RelatedList Module: "
            print related_list.module
            # Get the Name of each RelatedList
            print "\n RelatedList Name: "
            print related_list.name
            # Get the Action of each RelatedList
            print "\n RelatedList Action: "
            print related_list.action
            # Get the ID of each RelatedList
            print "\n RelatedList ID: "
            print related_list.id.to_s
            # Get the Href of each RelatedList
            print "\n RelatedList Href: "
            print related_list.href
            # Get the Type of each RelatedList
            print "\n RelatedList Type: "
            print related_list.type
            # Get the Connectedmodule of each RelatedList
            print "\n RelatedList Connectedmodule: "
            print related_list.connectedmodule
            # Get the Linkingmodule of each RelatedList
            print "\n RelatedList Linkingmodule: "
            print related_list.linkingmodule
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedLists::APIException
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

  def self.get_related_list(module_api_name, related_list_id)
    # """
    # This method is used to get the single related list data of a particular module with relatedListId and print the response.
    # :param module_api_name: The API Name of the module to get related list
    # :param related_list_id: The ID of the relatedList to be obtained
    # """

    # """
    # example
    # module_api_name = "Contacts"
    # related_list_id = '34096430062003'
    # """

    # Get instance of RelatedListsOperations Class that takes module_api_name as parameter
    rlo = ZOHOCRMSDK::RelatedLists::RelatedListsOperations.new(module_api_name)
    # Call get_related_list method which takes related_list_id as parameter
    response = rlo.get_related_list(related_list_id)

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
        if response_handler.is_a? ZOHOCRMSDK::RelatedLists::ResponseWrapper
          # Get the list of obtained RelatedList instances
          related_lists = response_handler.related_lists
          related_lists.each do |related_list|
            # Get the SequenceNumber of each RelatedList
            print "\n RelatedList SequenceNumber: "
            print related_list.sequence_number
            # Get the DisplayLabel of each RelatedList
            print "\n RelatedList DisplayLabel: "
            print related_list.display_label
            # Get the APIName of each RelatedList
            print "\n RelatedList APIName: "
            print related_list.api_name
            # Get the Module of each RelatedList
            print "\n RelatedList Module: "
            print related_list.module
            # Get the Name of each RelatedList
            print "\n RelatedList Name: "
            print related_list.name
            # Get the Action of each RelatedList
            print "\n RelatedList Action: "
            print related_list.action
            # Get the ID of each RelatedList
            print "\n RelatedList ID: "
            print related_list.id.to_s
            # Get the Href of each RelatedList
            print "\n RelatedList Href: "
            print related_list.href
            # Get the Type of each RelatedList
            print "\n RelatedList Type: "
            print related_list.type
            # Get the Connectedmodule of each RelatedList
            print "\n RelatedList Connectedmodule: "
            print related_list.connectedmodule
            # Get the Linkingmodule of each RelatedList
            print "\n RelatedList Linkingmodule: "
            print related_list.linkingmodule
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? ZOHOCRMSDK::RelatedLists::APIException
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
