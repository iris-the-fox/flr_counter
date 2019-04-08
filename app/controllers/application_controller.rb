class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_flr

  def set_current_flr
    @current_flr = Flr.find_by(current: true)
  end
end
