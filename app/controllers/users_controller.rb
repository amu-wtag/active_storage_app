class UsersController < ApplicationController
  # layout "application"
  def index
    @user = Users.all
  end

  def show
    if session[:user_id]
      @user = User.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.last_login = Time.now
    if @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect_to users_show_path, notice: "User created successfully"
    else
      render :new
    end
  end
  
  def delete
  end

  def login
  end

  def attempt_login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      @user.last_login = Time.now + 6.hours
      @user.save
      session[:user_id] = @user.id
      session[:user_name] = @user.name
      redirect_to users_show_path, notice: "Logged in successfully!"
    else
      flash.now[:notice] = "Invalid email or password"
      render :login
    end
  end
  def attempt_logout
    params[:id] = nil
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :pic, :document, :last_login, videos: [])
  end
end
