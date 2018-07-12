class DreamnamesController < ApplicationController
  
  def create
    second_name = params[:dreamname][:SDname]
    if regest(second_name)
      flash[:success] = '登録完了'
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash.now = '登録失敗'
    end
  end
  
  private
  
  def regest(second_name)
    session[:SDname] = second_name
    @SDname = session[:SDname]
    return true
  end
end
