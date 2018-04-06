class FriendshipsController < ApplicationController
  before_action :require_user_logged_in
  def create
    novel = Novel.find_by(id: params[:novel_id])
    if params[:type] == 'Like'
      current_user.like(novel)
      flash[:success] = '応援しました'
    end
    
    if params[:type] == 'Subscribe'
      current_user.subscribe(novel)
      flash[:success] = '購読しました'
    end
    
    redirect_back(fallback_location: root_path)
  end

  def destroy
    novel = Novel.find_by(id: params[:novel_id])
    if params[:type] == 'Like'
      current_user.unlike(novel) 
      flash[:success] = '応援を終了しました'
    end
    
    if params[:type] == 'Subscribe'
      current_user.unsubscribe(novel)
      flash[:success] = '購読を終了しました'
    end

    redirect_back(fallback_location: root_path)
  end
end
