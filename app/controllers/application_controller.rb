class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include DreamnamesHelper

  
  
  private

  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_novels = user.novels.count
    @count_followings = user.followings.count
    @count_followers = user.followers.count
    @count_subscribes = user.subscribe_novels.count
  end

end
