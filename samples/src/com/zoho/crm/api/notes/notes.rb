require 'ZOHOCRMSDK2_1'

class Note
  def self.get_notes
    # """
    # This method is used to get the list of notes and print the response.
    # """
    # Get instance of NotesOperations Class
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # pm.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesParam.page,"1")
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # hm.add(ZOHOCRMSDK::Notes::NotesOperations::GetNotesHeader.If_modified_since,"2020-08-05T13:36:16+05:30")
    # Call get_notes method that takes paramInstance and headerInstance as parameters
    response = no.get_notes(pm, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::Notes::ResponseWrapper
          # Get the list of obtained Note instances
          notes = response_handler.data
          notes.each do |note|
            # Get the owner User instance of each Note
            owner = note.owner
            # Check if owner is not None
            unless owner.nil?
              # Get the Name of the Owner
              print "\n Note Owner User-Name: "
              print owner.name
              # Get the ID of the Owner
              print "\n Note Owner User-Id: "
              print owner.id.to_s
              # Get the Email of the Owner
              print "\n Note Owner User-Email: "
              print owner.email
            end
            # Get the ModifiedTime of each Note
            print "\n Note ModifiedTime: "
            print note.modified_time
            # Get the list of Attachment instances of each Note
            attachments = note.attachments
            # Check if attachments is not None
            attachments&.each do |attachment|
              print_attachment(attachment)
            end
            # Get the CreatedTime of each Note
            print "\n Note CreatedTime:  "
            print note.created_time
            # Get the parentId Record instance of each Note
            parent_id = note.parent_id
            # Check if parent_id is not None
            unless parent_id.nil?
              unless parent_id.get_key_value('name').nil?
                # Get the parent record Name of each Note
                print "\n Note parent record Name: "
                print parent_id.get_key_value('name')
              end
              # Get the parent record ID of each Note
              print "\n Note parent record ID: "
              print parent_id.to_s
            end
            # Get the Editable of each Note
            print "\n Note Editable: "
            print note.editable
            # Get the SeModule of each Note
            print "\n Note SeModule: "
            print note.se_module
            # Get the IsSharedToClient of each Note
            print "\n Note IsSharedToClient: "
            print note.is_shared_to_client
            # Get the modifiedBy User instance of each Note
            modified_by = note.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n Note ModifiedBy User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n Note ModifiedBy User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modifiedBy User
              print "\n Note ModifiedBy User-Email: "
              print modified_by.email
            end
            created_by = note.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Note CreatedBy User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Note CreatedBy User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Note CreatedBy User-Email: "
              print created_by.email
            end
            # Get the Size of each Note
            print "\n Note Size: "
            print note.size
            # Get the State of each Note
            print "\n Note State: "
            print note.state
            # Get the VoiceNote of each Note
            print "\n Note VoiceNote: "
            print note.voice_note
            # Get the Id of each Note
            print "\n Note Id: "
            print note.id.to_s
            # Get the NoteTitle of each Note
            print "\n Note NoteTitle: "
            print note.note_title
            # Get the NoteContent of each Note
            print "\n Note NoteContent: "
            print note.note_content
          end
          # Get the Info object from obtained response
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n Note Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Note Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\nNote Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\Note Info more records: "
              print info.more_records
            end
          end
        # Get the Info object from obtained response
        elsif response_handler.is_a? ZOHOCRMSDK::Notes::APIException
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

  def self.print_attachment(attachment)
    # Get the owner User instance of each attachment
    owner = attachment.owner
    # Check if owner is not None
    unless owner.nil?
      # Get the ID of the Owner
      print "\n Note Attachment Owner User-ID:"
      print owner.id.to_s
      # Get the Name of the Owner
      print "\n Note Attachment Owner User-Name:"
      print owner.name
      # Get the Email of the Owner
      print "\n Note Attachment Owner User-Email:"
      print owner.email
      print "\n"
    end
    # Get the modified time of each attachment
    print "\n Note Attachment Modified Time:"
    print attachment.modified_time
    # Get the name of the File
    print "\n Note Attachment File Name:"
    print attachment.file_name
    # Get the created time of each attachment
    print "\n Note Attachment Created Time:"
    print attachment.created_time
    # Get the Attachment file size
    print "\n Note Attachment File Size:"
    print attachment.size
    print "\n"
    # Get the parentId Record instance of each attachment
    parent_id = attachment.parent_id
    unless parent_id.nil?
      # Get the parent record Name of each attachment
      print "\n Note Attachment parent record Name: "
      print parent_id.get_key_value('name')
      # Get the parent record ID of each attachment
      print "\n Note Attachment parent record ID: "
      print parent_id.to_s
    end
    # Check if the attachment is Editable
    print "\n Note Attachment Editable:"
    print attachment.editable
    # Get the file ID of each attachment
    print "\n Note Attachment File ID:"
    print attachment.file_id
    # Get the type of each attachment
    print "\n Note Attachment File Type:"
    print attachment.type
    # Get the seModule of each attachment
    print "\n Note Attachment seModule:"
    print attachment.se_module
    print "\n"
    # Get the modifiedBy User instance of each attachment
    modified_by = attachment.modified_by
    # Check if modifiedBy is not None
    unless modified_by.nil?
      # Get the Name of the modifiedBy User
      print "\n Note Attachment Modified User-Name:"
      print modified_by.name
      # Get the ID of the modifiedBy User
      print "\n Note Attachment Modified User-ID:"
      print modified_by.id.to_s
      # Get the Email of the modifiedBy User
      print "\n Note Attachment Modified User-Email:"
      print modified_by.email
      print "\n"
    end
    # Get the state of each attachment
    print "\n Note Attachment State:"
    print attachment.state
    # Get the ID of each attachment
    print "\n Note Attachment ID:"
    print attachment.id.to_s
    # Check if created_by is not None
    created_by = attachment.created_by
    # Check if created_by is not None
    unless created_by.nil?
      # Get the Name of the created_by User
      print "\n Note Attachment Created User-Name:"
      print created_by.name
      # Get the ID of the created_by User
      print "\n Note Attachment Created User-ID:"
      print created_by.id.to_s
      # Get the Email of the created_by User
      print "\n Note Attachment Created User-Email:"
      print created_by.email
      print "\n"
    end
    # Get the LinkUrl of each attachment
    print "\n Note Attachment LinkUrl"
    print attachment.link_url
  end

  def self.create_notes
    # """
    # This method is used to add new notes and print the response.
    # """
    # Get instance of NotesOperations Class
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # List to hold Note instances
    notes = []
    (0..5).each do |i|
      # Get instance of Note Class
      note = ZOHOCRMSDK::Notes::Note.new
      # Set Note Title of the Note
      note.note_title = 'Contacted'
      # Set Note Content of the Note
      note.note_content = 'Need to do further tracking'
      # Get instance of Record Class
      parent_record = ZOHOCRMSDK::Record::Record.new
      # Set ID of the Record
      parent_record.id = 347706112692006
      # Set ParentId of the Note
      note.parent_id = parent_record
      # Set SeModule of the Record
      note.se_module = 'Leads'
      notes.push(note)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::Notes::BodyWrapper.new
    # Set the list to notes in BodyWrapper instance
    body_wrapper.data = notes
    # Call create_notes method that takes BodyWrapper instance as parameter
    response = no.create_notes(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Notes::APIException
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

  def self.update_notes
    # Get instance of NotesOperations Class
    notes_id = [347706112814001, 347706112814002]
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # List to hold Note instances
    notes = []
    (0..1).each do |i|
      # Get instance of Note Class
      note = ZOHOCRMSDK::Notes::Note.new
      # Set Note Title of the Note
      note.note_title = 'Contacted'
      # Set Note ID of the Note
      note.id = notes_id[i]
      # Set Note Content of the Note
      note.note_content = 'Need to do further tracking'
      # Get instance of Record Class
      parent_record = ZOHOCRMSDK::Record::Record.new
      # Set ID of the Record
      parent_record.id = 347706112692006
      # Set ParentId of the Note
      note.parent_id = parent_record
      # Set SeModule of the Record
      note.se_module = 'Leads'
      notes.push(note)
    end
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::Notes::BodyWrapper.new
    # Set the list to notes in BodyWrapper instance
    body_wrapper.data = notes
    # Call update_notes method that takes BodyWrapper instance as parameter
    response = no.update_notes(body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Notes::APIException
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

  def self.delete_notes(notes_id)
    # """
    # This method is used to delete notes in bulk and print the response.
    # :param note_ids: The list of Note IDs to be deleted
    # """

    # """
    # example
    # note_ids = ["34096430648001", "34096430648005"]
    # """
    # Get instance of NotesOperations Class
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # Add the ids to ParameterMap instance
    notes_id.each do |note_id|
      pm.add(ZOHOCRMSDK::Notes::NotesOperations::DeleteNotesParam.ids, note_id)
    end
    # Call delete_notes method that takes param_instance as parameter
    response = no.delete_notes(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Notes::APIException
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

  def self.get_note(note_id)
    # """
    # This method is used to get the note with id and print the response.
    # :param note_id: The ID of the Note to be obtained
    # """

    # """
    # example
    # note_id = "34096430549003"
    # """
    # Get instance of NotesOperations Class
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # Call get_note method that takes note_id as parameter
    # Get instance of ParameterMap Class
    pm = ZOHOCRMSDK::ParameterMap.new
    # pm.add(ZOHOCRMSDK::Notes::NotesOperations::GetNoteParam.fields,"")
    # Get instance of HeaderMap Class
    hm = ZOHOCRMSDK::HeaderMap.new
    # hm.add(ZOHOCRMSDK::Notes::NotesOperations::GetNoteHeader.If_modified_since,"2020-08-05T13:36:16+05:30")
    response = no.get_note(note_id,pm, hm)
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
        if response_handler.is_a? ZOHOCRMSDK::Notes::ResponseWrapper
          # Get the list of obtained Note instances
          notes = response_handler.data
          notes.each do |note|
            # Get the owner User instance of each Note
            owner = note.owner
            # Check if owner is not None
            unless owner.nil?
              # Get the Name of the Owner
              print "\n Note Owner User-Name: "
              print owner.name
              # Get the ID of the Owner
              print "\n Note Owner User-Id: "
              print owner.id.to_s
              # Get the Email of the Owner
              print "\n Note Owner User-Email: "
              print owner.email
            end
            # Get the ModifiedTime of each Note
            print "\n Note ModifiedTime: "
            print note.modified_time
            # Get the list of Attachment instances of each Note
            attachments = note.attachments
            # Check if attachments is not None
            attachments&.each do |attachment|
              print_attachment(attachment)
            end
            # Get the CreatedTime of each Note
            print "\n Note CreatedTime:  "
            print note.created_time
            # Get the parentId Record instance of each Note
            parent_id = note.parent_id
            # Check if parent_id is not None
            unless parent_id.nil?
              unless parent_id.get_key_value('name').nil?
                # Get the parent record Name of each Note
                print "\n Note parent record Name: "
                print parent_id.get_key_value('name')
              end
              # Get the parent record ID of each Note
              print "\n Note parent record ID: "
              print parent_id.to_s
            end
            # Get the Editable of each Note
            print "\n Note Editable: "
            print note.editable
            # Get the SeModule of each Note
            print "\n Note SeModule: "
            print note.se_module
            # Get the IsSharedToClient of each Note
            print "\n Note IsSharedToClient: "
            print note.is_shared_to_client
            # Get the modifiedBy User instance of each Note
            modified_by = note.modified_by
            # Check if modifiedBy is not None
            unless modified_by.nil?
              # Get the Name of the modifiedBy User
              print "\n Note ModifiedBy User-Name: "
              print modified_by.name
              # Get the ID of the modifiedBy User
              print "\n Note ModifiedBy User-Id: "
              print modified_by.id.to_s
              # Get the Email of the modifiedBy User
              print "\n Note ModifiedBy User-Email: "
              print modified_by.email
            end
            created_by = note.created_by
            # Check if created_by is not None
            unless created_by.nil?
              # Get the Name of the created_by User
              print "\n Note CreatedBy User-Name: "
              print created_by.name
              # Get the ID of the created_by User
              print "\n Note CreatedBy User-Id: "
              print created_by.id.to_s
              # Get the Email of the created_by User
              print "\n Note CreatedBy User-Email: "
              print created_by.email
            end
            # Get the Size of each Note
            print "\n Note Size: "
            print note.size
            # Get the State of each Note
            print "\n Note State: "
            print note.state
            # Get the VoiceNote of each Note
            print "\n Note VoiceNote: "
            print note.voice_note
            # Get the Id of each Note
            print "\n Note Id: "
            print note.id.to_s
            # Get the NoteTitle of each Note
            print "\n Note NoteTitle: "
            print note.note_title
            # Get the NoteContent of each Note
            print "\n Note NoteContent: "
            print note.note_content
          end
          # Get the Info object from obtained response
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n Note Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Note Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\nNote Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\Note Info more records: "
              print info.more_records
            end
          end
        # Get the Info object from obtained response
        elsif response_handler.is_a? ZOHOCRMSDK::Notes::APIException
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

  def self.update_note(note_id)
    # """
    # This method is used to update an existing note and print the response.
    # :param note_id: The ID of the Note to be updated
    # """

    # """
    # example
    # note_id = '34096432193004'
    # """
    # Get instance of NotesOperations Class
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # Get instance of Note Class
    note = ZOHOCRMSDK::Notes::Note.new
    # Set Note Title of the Note
    note.note_title = 'Contacted'
    # Set Note Content of the Note
    # note.note_content = 'Need to do further tracking'
    # Get instance of Record Class
    parent_record = ZOHOCRMSDK::Record::Record.new
    # Set ID of the Record
    parent_record.id = 3_524_033__005_495_066
    # Set ParentId of the Note
    note.parent_id = parent_record
    # Set SeModule of the Record
    note.se_module = 'Leads'
    notes = [note]
    # Get instance of BodyWrapper Class that will contain the request body
    body_wrapper = ZOHOCRMSDK::Notes::BodyWrapper.new
    # Set the list to notes in BodyWrapper instance
    body_wrapper.data = notes
    # Call update_notes method that takes BodyWrapper instance as parameter
    response = no.update_note(note_id,body_wrapper)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Notes::APIException
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

  def self.delete_note(note_id)
    # """
    # This method is used to delete a single note with ID and print the response.
    # :param note_id: The ID of the note to be deleted
    # """

    # """
    # example
    # note_id = "34096430549003"
    # """
    # Get instance of NotesOperations Class
    no = ZOHOCRMSDK::Notes::NotesOperations.new
    # Call delete_note method that takes note_id as parameter
    response = no.delete_note(note_id)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? ZOHOCRMSDK::Notes::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.data
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? ZOHOCRMSDK::Notes::SuccessResponse
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
            elsif action_response.is_a? ZOHOCRMSDK::Notes::APIException
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
        elsif action_handler.is_a? ZOHOCRMSDK::Notes::APIException
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
