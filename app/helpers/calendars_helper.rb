module CalendarsHelper
  
#This plugin is limited in functionality and it cannot display events by weeks. 
#There is an alternative solution based on jQuery:: http://arshaw.com/fullcalendar/
#and has a rails backend for it: https://github.com/bokmann/rails3_fullcalendar


  def event_calendar
    # args is an argument hash containing :event, :day, and :options
    calendar event_calendar_opts do |args|
      event, day = args[:event], args[:day]
      html = %(<a href="/events/#{event.id}" title="#{h(event.name)}">)
      html << display_event_time(event, day)
      html << %(#{h(event.name)}</a>)
      html
    end
  end
  
  def display_event_time(event, day)
    time = event.start_at
    if !event.all_day and time.to_date == day
      t = I18n.localize(time, :format => "%l:%M%p")
    %(<span class="ec-event-time">#{t}</span>)
    else
    ""
    end
  end
  
  def event_calendar_opts
    { 
      :year => @year,
      :month => @month,
      :event_strips => @event_strips,
      :month_name_text => I18n.localize(@shown_month, :format => "%B %Y"),
      :previous_month_text => "<< " + month_link(@shown_month.prev_month),
      :next_month_text => month_link(@shown_month.next_month) + " >>",
      :use_all_day => true
    }
  end
  
  def month_link(month_date)
    link_to(I18n.localize(month_date, :format => "%B"), {:month => month_date.month, :year => month_date.year})
  end
  
end
