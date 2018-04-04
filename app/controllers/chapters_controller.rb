class ChaptersController < ApplicationController
  before_action :require_user_logged_in, only:[:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy]
  
  def new
    @chapter = @novel.chapters.new
  end

  def create
    @chapter = @novel.chapters.build(chapter_params)
    if @chapter.save
      flash[:success] = '小説を投稿しました。'
      redirect_to @novel
    else
      flash.now[:danger] = '小説の投稿に失敗しました。'
      render :new
    end
  end

  def edit
    @chapter = @novel.chapters.find_by(id: params[:id])
  end

  def update
    @chapter = @novel.chapters.find_by(id: params[:id])
    if @chapter.update(chapter_params)
      flash[:success] = '変更しました。'
      redirect_to @novel
    else
      flash.now[:danger] = '変更に失敗しました。'
      render :edit
    end
  end

  def destroy
    @chapter = @novel.chapters.find_by(id: params[:id])
    @chapter.destroy
    flash[:success] = '章を削除しました。'
    redirect_to @novel
  end

  def show
    @novel = Novel.find_by(id: params[:novel_id])
    @chapter = @novel.chapters.find_by(id: params[:id])
  end
  
  private
  
  def chapter_params
    params.require(:chapter).permit(:chapter_title, :content)
  end
  
  def correct_user
    @novel = current_user.novels.find_by(id: params[:novel_id])
    unless @novel
      redirect_back(fallback_location: root_path)
    end
  end
end
