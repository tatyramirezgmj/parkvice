class UsersController < ApplicationController
    # http_basic_authenticate_with :user, :email, :phone_number, :password
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
      redirect_to root_path, notice: "Thank you for singning up. You will recive our nothifications, through text message."
    else
      render "new"
    end
  end

  def show
  end

  def send_text
    @user = User.new(params[:phone_number])
    @user.send_sms(@user.clean_number)
    redirect_to :back
  end


  private
 def allowed_params
   params.require(:user).permit(:username, :email, :phone_number, :password, :password_digest)
 end
end
