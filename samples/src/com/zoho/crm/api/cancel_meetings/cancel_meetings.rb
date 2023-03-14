require 'ZOHOCRMSDK2_1'


class Cancelmeetings

  def self.cancel_meeting(event_id,send_cancel_mail)

    cmo = ZOHOCRMSDK::CancelMeetings::CancelMeetingsOperations.new(event_id)
    
    body_wrapper = ZOHOCRMSDK::CancelMeetings::BodyWrapper.new

    notify = ZOHOCRMSDK::CancelMeetings::Notify.new

    notify.send_cancelling_mail =send_cancel_mail

    notify_list = []

    notify_list.push(notify)

    body_wrapper.data =notify_list

    response = cmo.cancel_meetings(body_wrapper)

    unless response.nil?

      status_code = response.status_code

      print "\n Status Code :" + status_code.to_s

      if response.is_expected

        action_handler = response.data_object

        if action_handler.is_a? ZOHOCRMSDK::CancelMeetings::ActionWrapper
          action_wrapper = action_handler
          action_responses = action_wrapper.data
          action_responses.each do |action_response|

            if action_response.is_a? ZOHOCRMSDK::CancelMeetings::SuccessResponse
              success_response = action_response
              print "\n code:"
              print success_response.code.value

              print "\n status:"
              print success_response.status.value

              print "\n message:"
              print success_response.message.value

              success_response.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end

            elsif action_response.is_a? ZOHOCRMSDK::CancelMeetings::APIException
              api_exception = action_response

              print "\n code:"
              print api_exception.code.value

              print "\n status:"
              print api_exception.status.value

              print "\n message:"
              print api_exception.message.value

              api_exception.details.each do |k, v|
                print "\n"
                print k
                print v
                print "\n"
              end
              print "\n"
            end
          end

        elsif action_handler.is_a? ZOHOCRMSDK::CancelMeetings::APIException
          exception = action_handler

          print 'code:'
          print exception.code.value

          print "\n status:"
          print exception.status.value

          print "\n message:"
          print exception.message.value

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

