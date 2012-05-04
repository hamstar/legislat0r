class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale # This does not work currently. We need a user model first.

  def set_locale
    # This requires a user model to work. I'm assuming there will be a "current_user" helper.
    # If we decide to use Devise, that will be default.
    # I18n.locale = current_user.language || I18n.default_locale
  end
end
