class UsersController < ApplicationController
  before_action :require_login, except: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @upcoming_events = current_user.attended_events.upcoming
    @past_events = current_user.attended_events.past
    @created_events = current_user.created_events
  end

  private

  def require_login
    return if user_signed_in?

    flash[:error] = 'You must be logged in to access this section'
    redirect_to events_path # halts request cycle
  end
end
