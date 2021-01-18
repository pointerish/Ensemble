module EventsHelper
  def attending?(event_id, user_id)
    found = nil
    Event.find(event_id).attendants.each do |attendant|
      found = attendant.user_id == user_id
    end
    found
  end
end
