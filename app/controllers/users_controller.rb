class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
    @past_events = current_user.attended_events.past
    @upcoming_events = current_user.attended_events.upcoming
  end
end
