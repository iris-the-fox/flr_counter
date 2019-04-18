class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :set_current_flr
  before_action :set_my_group

  def set_current_flr
    @current_flr = Flr.find_by(current: true)
  end

  def set_my_group
  	@my_group = @current_flr.groups.find_by(user_id: current_user.id)
  end

end
