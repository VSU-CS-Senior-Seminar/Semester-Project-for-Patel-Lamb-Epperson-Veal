class ApplicationController < ActionController::Base

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
  helper_method :mailbox, :conversation

  private

  def mailbox
    @mailbox ||= current_user.mailbox
  end

  def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end
    
Warden::Manager.after_authentication do |user,auth,opts|
    user.update_attribute(:logged_in, true)
end

Warden::Manager.before_logout do |user,auth,opts|
    user.update_attribute(:logged_in, false)
end
    
end
