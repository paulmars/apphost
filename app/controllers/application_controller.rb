class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :secure_prod

private

  def secure_prod
    return unless Rails.env.production?
    return if request.ssl?
    redirect_to "https://apphoster.herokuapp.com/"
  end

end
