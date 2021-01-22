module EventsHelper
  def attending?(event_id, user_id)
    found = nil
    Event.find(event_id).attendees.each do |attendant|
      found = attendant.id == user_id
    end
    found
  end
end
