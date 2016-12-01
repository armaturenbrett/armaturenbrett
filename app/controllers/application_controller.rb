class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale

  def dashboard
  end

  private

  def set_locale
    @locale = params[:locale]
    @locale ||= cookies[:locale]
    @locale ||= request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first

    I18n.locale = @locale
    cookies[:locale] = @locale

    @locale
  rescue
    I18n.locale = :de
    @locale = 'de'
  end
end
