module EventsHelper
  def attend_button(_event)
    (button_to 'Attend', attend_event_path(@event.id), method: :post) if user_signed_in?
  end
end
