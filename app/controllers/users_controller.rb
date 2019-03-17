class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]
  
  def index
    @users = User.all.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @novels = @user.novels.order('created_at DESC').page(params[:page])
    counts(@user)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'You completed registration!'
      redirect_to login_path
    else
      flash.now[:danger] = 'You failed regestration!'
      render :new
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
     
    if @user.update(user_params)
      flash[:success] = 'You update user information!'
      redirect_to @user
    else
      flash.now[:danger] = 'You failed to update user information!'
      render :edit
    end
  end
  
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  def subscribes
    @user = User.find(params[:id])
    @subscribes = @user.subscribe_novels.page(params[:page])
    counts(@user)
  end
  
  private

  def user_params
    params.require(:user).permit(:user_name, :user_code, :profile, :password, :password_confirmation)
  end
  
  def correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_back(fallback_location: root_path)
    end
  end
end
