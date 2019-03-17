class FriendshipsController < ApplicationController
  before_action :require_user_logged_in
  def create
    novel = Novel.find_by(id: params[:novel_id])
    if params[:type] == 'Like'
      current_user.like(novel)
      flash[:success] = 'You liked!'
    end
    
    if params[:type] == 'Subscribe'
      current_user.subscribe(novel)
      flash[:success] = 'You subscribed!'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    novel = Novel.find_by(id: params[:novel_id])
    if params[:type] == 'Like'
      current_user.unlike(novel) 
      flash[:success] = 'You stopped liking!'
    end
    
    if params[:type] == 'Subscribe'
      current_user.unsubscribe(novel)
      flash[:success] = 'You stopped subscribing!'
    end

    redirect_back(fallback_location: root_path)
  end
end
