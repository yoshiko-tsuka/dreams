class DreamnamesController < ApplicationController
  
  def create
    second_name = params[:dreamname][:SDname]
    if regest(second_name)
      flash[:success] = 'you completed registration!'
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash.now = 'you failed regestration!'
    end
  end
  
  private
  
  def regest(second_name)
    session[:SDname] = second_name
    @SDname = session[:SDname]
    return true
  end
end
