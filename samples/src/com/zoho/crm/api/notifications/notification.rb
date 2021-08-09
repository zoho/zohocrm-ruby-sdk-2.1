require 'ZCRMSDK'
require 'date'

class Notifications
  def self.enable_notifications
    # """
    # This method is used to Enable Notifications and print the response.
    # """
    # Get instance of NotificationOperations Class
    no = Notification::NotificationOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Notification::BodyWrapper.new
    # Get instance of Notification Class
    notification = Notification::Notification.new
    # Set channel Id of the Notification
    notification.channel_id = 10_000_000_680_211
    events = ['Deals.all']
    # To subscribe based on particular operations on given modules.
    notification.events = events
    # To set the expiry time for instant notifications.
    notification.channel_expiry = DateTime.new(2021, 2, 3, 4, 5, 6, '+5:30')
    # By using this value, user can validate the notifications.
    notification.token = 'TOKEN_FOR_VERIFICATION_OF_100068002'
    # URL to be notified (POST request)
    notification.notify_url = 'https://www.zohoapis.com'
    # List to hold Notification instances
    notifications = [notification]
    # Set the list to notifications in BodyWrapper instance
    bw.watch = notifications
    # Call enable_notifications method that takes BodyWrapper instance as parameter
    response = no.enable_notifications(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Notification::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.watch
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Notification::SuccessResponse
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
              success_response.details.each do |k, v|
                data_list = v
                if data_list.is_a? Array
                  if data_list.length.positive? && data_list[0].is_a?(Notification::Notification)
                    event_list = data_list
                    event_list.each do |event|
                      # Get the ChannelExpiry of each Notification
                      print "\n Notification ChannelExpiry: "
                      print event.channel_expiry
                      # Get the ResourceUri of each Notification
                      print "\n Notification ResourceUri: "
                      print event.resource_uri
                      # Get the ResourceId of each Notification
                      print "\n Notification ResourceId: "
                      print event.resource_id
                      # Get the ResourceName of each Notification
                      print "\n Notification ResourceName: "
                      print event.resource_name
                      # Get the ChannelId of each Notification
                      print "\n Notification ChannelId: "
                      print event.channel_id
                    end
                  end
                else
                  print "\n"
                  print k
                  print v
                  print "\n"
                end
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Notification::APIException
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
        elsif action_handler.is_a? Notification::APIException
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

  def self.get_notification_details
    # """
    # This method is used to get details of the Notification and print the response.
    # """
    # Get instance of NotificationOperations Class
    no = Notification::NotificationOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    pm.add(Notification::NotificationOperations::GetNotificationDetailsParam.channel_id, 10_000_000_680_211)
    pm.add(Notification::NotificationOperations::GetNotificationDetailsParam.module_1, 'Deals')
    # Call get_notification_details method
    response = no.get_notification_details(pm)
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
        if response_handler.is_a? Notification::ResponseWrapper
          # Get the list of obtained Notification instances
          notifications = response_handler.watch
          notifications.each do |notification|
            # Get the NotifyOnRelatedAction of each Notification
            print 'Notification NotifyOnRelatedAction: '
            print notification.notify_on_related_action
            # Get the ChannelExpiry of each Notification
            print "\n Notification ChannelExpiry: "
            print notification.channel_expiry
            # Get the ResourceUri of each Notification
            print "\n Notification ResourceUri: "
            print notification.resource_uri
            # Get the ResourceId of each Notification
            print 'Notification ResourceId: '
            print notification.resource_id
            # Get the NotifyUrl of each Notification
            print "\n Notification NotifyUrl: "
            print notification.notify_url
            # Get the ResourceName of each Notification
            print "\n Notification ResourceName: "
            print notification.resource_name
            # Get the ChannelId of each Notification
            print "\n Notification ChannelId: "
            print notification.channel_id
            # Get the events List of each Notification
            fields = notification.events
            fields&.each do |field|
              print "\n Notification Events: "
              print field
            end
            # Get the Token each Notification
            print "\n Notification Token: "
            print notification.token
          end
          info = response_handler.info
          unless info.nil?
            # Get the PerPage from Info
            unless info.per_page.nil?
              print "\n Record Info PerPage: "
              print info.per_page
            end
            # Get the Count from Info
            unless info.count.nil?
              print "\n Record Info Count:  "
              print info.count
            end
            # Get the Page from Info
            unless info.count.nil?
              print "\n Record Info Page: "
              print info.page
            end
            # Get the MoreRecords from Info
            unless info.more_records.nil?
              print "\n Record Info more records: "
              print info.more_records
            end
          end
        # Check if the request returned an exception
        elsif response_handler.is_a? Notification::APIException
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

  def self.update_notifications
    # """
    # This method is used to update Notifications and print the response.
    # """
    # Get instance of NotificationOperations Class
    # Get instance of NotificationOperations Class
    no = Notification::NotificationOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Notification::BodyWrapper.new
    # Get instance of Notification Class
    notification = Notification::Notification.new
    # Set channel Id of the Notification
    notification.channel_id = 10_000_000_680_211
    events = ['Deals.all']
    # To subscribe based on particular operations on given modules.
    notification.events = events
    # To set the expiry time for instant notifications.
    notification.channel_expiry = DateTime.new(2021, 2, 3, 4, 5, 6, '+5:30')
    # By using this value, user can validate the notifications.
    notification.token = 'TOKEN_FOR_VERIFICATION_OF_100068002'
    # URL to be notified (POST request)
    notification.notify_url = 'https://www.zohoapis.com'
    # List to hold Notification instances
    notifications = [notification]
    # Set the list to notifications in BodyWrapper instance
    bw.watch = notifications
    # Call update_notifications method that takes BodyWrapper instance as parameter
    response = no.update_notifications(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Notification::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.watch
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Notification::SuccessResponse
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
              success_response.details.each do |k, v|
                data_list = v
                if data_list.is_a? Array
                  if data_list.length.positive? && data_list[0].is_a?(Notification::Notification)
                    event_list = data_list
                    event_list.each do |event|
                      # Get the ChannelExpiry of each Notification
                      print "\n Notification ChannelExpiry: "
                      print event.channel_expiry
                      # Get the ResourceUri of each Notification
                      print "\n Notification ResourceUri: "
                      print event.resource_uri
                      # Get the ResourceId of each Notification
                      print "\n Notification ResourceId: "
                      print event.resource_id
                      # Get the ResourceName of each Notification
                      print "\n Notification ResourceName: "
                      print event.resource_name
                      # Get the ChannelId of each Notification
                      print "\n Notification ChannelId: "
                      print event.channel_id
                    end
                  end
                else
                  print "\n"
                  print k
                  print v
                  print "\n"
                end
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Notification::APIException
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
        elsif action_handler.is_a? Notification::APIException
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

  def self.update_notification
    # """
    # This method is used to update single Notification and print the response.
    # """
    # Get instance of NotificationOperations Class
    no = Notification::NotificationOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Notification::BodyWrapper.new
    # Get instance of Notification Class
    notification = Notification::Notification.new
    # Set channel Id of the Notification
    notification.channel_id = 10_000_000_680_211
    events = ['Deals.all']
    # To subscribe based on particular operations on given modules.
    notification.events = events
    # To set the expiry time for instant notifications.
    notification.channel_expiry = DateTime.new(2021, 2, 3, 4, 5, 6, '+5:30')
    # By using this value, user can validate the notifications.
    notification.token = 'TOKEN_FOR_VERIFICATION_OF_100068002'
    # URL to be notified (POST request)
    notification.notify_url = 'https://www.zohoapis.com'
    # List to hold Notification instances
    notifications = [notification]
    # Set the list to notifications in BodyWrapper instance
    bw.watch = notifications
    # Call update_notification method that takes BodyWrapper instance as parameters
    response = no.update_notification(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Notification::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.watch
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Notification::SuccessResponse
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
              success_response.details.each do |k, v|
                data_list = v
                if data_list.is_a? Array
                  if data_list.length.positive? && data_list[0].is_a?(Notification::Notification)
                    event_list = data_list
                    event_list.each do |event|
                      # Get the ChannelExpiry of each Notification
                      print "\n Notification ChannelExpiry: "
                      print event.channel_expiry
                      # Get the ResourceUri of each Notification
                      print "\n Notification ResourceUri: "
                      print event.resource_uri
                      # Get the ResourceId of each Notification
                      print "\n Notification ResourceId: "
                      print event.resource_id
                      # Get the ResourceName of each Notification
                      print "\n Notification ResourceName: "
                      print event.resource_name
                      # Get the ChannelId of each Notification
                      print "\n Notification ChannelId: "
                      print event.channel_id
                    end
                  end
                else
                  print "\n"
                  print k
                  print v
                  print "\n"
                end
              end
            # Check if the request returned an exception
            elsif action_response.is_a? Notification::APIException
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
        elsif action_handler.is_a? Notification::APIException
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

  def self.disable_notifications(channel_ids)
    # """
    # To stop all the instant notifications enabled by the user for a channel.
    # :param channel_ids: A list containing the unique IDs of the notification channels to be disabled.
    # """
    # Get instance of NotificationOperations Class
    no = Notification::NotificationOperations.new
    # Get instance of ParameterMap Class
    pm = ParameterMap.new
    channel_ids.each do |channel_id|
      pm.add(Notification::NotificationOperations::DisableNotificationsParam.channel_ids, channel_id)
    end
    # Call disable_notifications method that takes paramInstance as parameter
    response = no.disable_notifications(pm)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Notification::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.watch
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Notification::SuccessResponse
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
            elsif action_response.is_a? Notification::APIException
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
        elsif action_handler.is_a? Notification::APIException
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

  def self.disable_notification
    # """
    # This method is used to disable notifications for the specified events in a channel.
    # """
    # Get instance of NotificationOperations Class
    no = Notification::NotificationOperations.new
    # Get instance of BodyWrapper Class that will contain the request body
    bw = Notification::BodyWrapper.new
    # Get instance of Notification Class
    notification = Notification::Notification.new
    # Set channel Id of the Notification
    notification.channel_id = 10_000_000_680_211
    # To subscribe based on particular operations on given modules.
    events = ['Deals.edit']
    notification.deleteevents = true
    notification.events = events
    # Add Notification instance to the list
    notifications = [notification]
    # Set the list to notifications in BodyWrapper instance
    bw.watch = notifications
    response = no.disable_notification(bw)
    unless response.nil?
      status_code = response.status_code
      # Get the status code from response
      print "\n Status Code :" + status_code.to_s
      # Check if expected instance is received.
      if response.is_expected
        # Get object from response
        action_handler = response.data_object
        # Check if expected ActionWrapper instance is received.
        if action_handler.is_a? Notification::ActionWrapper
          action_wrapper = action_handler
          # Get the list of obtained ActionResponse instances
          action_responses = action_wrapper.watch
          action_responses.each do |action_response|
            # Check if expected SuccessResponse instance is received.
            if action_response.is_a? Notification::SuccessResponse
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
            elsif action_response.is_a? Notification::APIException
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
        elsif action_handler.is_a? Notification::APIException
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
