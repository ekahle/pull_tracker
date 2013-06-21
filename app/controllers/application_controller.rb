class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter do
    :authenticate_user!
    set_current_user
  end

  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end

  private

  def set_current_user
    @current_user = current_user
  end
end
