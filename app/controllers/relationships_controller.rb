class RelationshipsController < ApplicationController
  before_action :require_user_logged_in
  def create
    user = User.find(params[:follow_id])
    current_user.follow(user)
    flash[:success] = 'You followed the user!'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    user = User.find(params[:follow_id])
    current_user.unfollow(user)
    flash[:success] = 'You unfollowed the user!'
    redirect_back(fallback_location: root_path)
  end
end
