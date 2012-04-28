class CalendarsController < ApplicationController
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i
    
    @shown_month = Date.civil(@year, @month)

    # access to events, not just the event strip
#    start_d, end_d = Event.get_start_and_end_dates(@shown_month) 
#    @events = Event.events_for_date_range(start_d, end_d)
#    @event_strips = Event.create_event_strips(start_d, end_d, @events)
    
    @event_strips = Event.event_strips_for_month(@shown_month)
    
  end
  
end
