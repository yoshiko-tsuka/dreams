class NovelsController < ApplicationController
  before_action :require_user_logged_in, only:[:new, :create, :edit, :update, :delete]
  before_action :correct_user, only: [:edit, :update, :delete]

  def show
    @novel = Novel.find(params[:id])
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = current_user.novels.build(novel_params)
    if @novel.save
      flash[:success] = '小説を投稿しました。'
      redirect_to @novel
    else
      @novel = current_user.novels.order('created_at DESC').page(params[:page])
      flash.now[:danger] = '小説の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @novel = Novel.find(params[:id])
  end

  def update
    @novel = Novel.find(params[:id])
  end

  def destroy
    @novel.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def novel_params
    params.require(:novel).permit(:title, :atmosphere)
  end
  
  def correct_user
    @novel = current_user.novels.find_by(id: params[:id])
    unless @novel
      redirect_back(fallback_location: root_path)
    end
  end
end
