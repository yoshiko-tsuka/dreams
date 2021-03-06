class NovelsController < ApplicationController
  before_action :require_user_logged_in, only:[:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @novel = Novel.find(params[:id])
  end

  def new
    @novel = Novel.new
  end

  def create
    @novel = current_user.novels.build(novel_params)
    if @novel.save
      flash[:success] = 'You posted your novel!'
      redirect_to @novel
    else
      flash.now[:danger] = 'You failed to post your novel!'
      render :new
    end
  end

  def edit
  end

  def update
    if @novel.update(novel_params)
      flash[:success] = 'You changed!'
      redirect_to @novel
    else
      flash.now[:danger] = 'You failed to change!'
      render :edit
    end
  end

  def destroy
    @novel.destroy
    flash[:success] = 'You deleted your novel!'
    redirect_to current_user
  end
  
  private
  
  def novel_params
    params.require(:novel).permit(:title, :atmosphere, :resume)
  end
  
  def correct_user
    @novel = current_user.novels.find_by(id: params[:id])
    unless @novel
      redirect_back(fallback_location: root_path)
    end
  end
  
end
