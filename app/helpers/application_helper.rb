module ApplicationHelper
  def error_message_for_form object
     render :partial => "shared/form_error_messages", :locals => {:object => object}
  end
    
end
