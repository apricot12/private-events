class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
    @upcoming_events = current_user.attended_events.upcoming
    @attended_events = current_user.attended_events.past
    @created_events = current_user.created_events
  end
end
