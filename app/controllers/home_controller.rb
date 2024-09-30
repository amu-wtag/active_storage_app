class HomeController < ApplicationController
  def index
    @user = current_user
    if @user
      session[:user_name] = @user.name
    end
  end
end
