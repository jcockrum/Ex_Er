module ApplicationHelper
  
  def datepicker_form(form_data)
    return form_data.strftime('%d-%m-%Y')
  end
 
end
