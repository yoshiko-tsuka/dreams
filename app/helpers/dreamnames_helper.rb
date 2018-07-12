module DreamnamesHelper
  def dream_in?
    if session[:SDname] === nil || session[:SDname] === ""
      return false
    else
      return true
    end
  end
end
