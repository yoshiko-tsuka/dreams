class SessionsController < ApplicationController
  def new
  end

  def create
    user_code = params[:session][:user_code]
    password = params[:session][:password]
    if login(user_code, password)
      flash[:success] = 'login successful!'
      redirect_to @user
    else
      flash.now[:danger] = 'You failed to login!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'logout successful!'
    redirect_to root_url
  end
  
  private

  def login(user_code, password)
    @user = User.find_by(user_code: user_code)
    if @user && @user.authenticate(password)
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
