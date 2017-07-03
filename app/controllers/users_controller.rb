class UsersController < ApplicationController
    # http_basic_authenticate_with :user, :email, :phone_number, :password
  before_action :authorize
  def index
    @user = current_user
  end

  def new
    @user= User.new
  end
  
  def create
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thank you for singning up. You will receive our nothifications, through text message."
    else
      render "new"
    end
  end

  private
 def allowed_params
   params.require(:user).permit(:username, :email, :phone_number, :password, :password_digest)
 end
end
