class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params) # temporarily creates user but doesn't save

    if @user.save #if the user was created and saved in the db
      login!(@user) # sets the session[:session_token] = reset_session_token
      redirect_to user_url(@user) #brings us to show page
    else
      flash[:errors] = @user.errors.full_messages # stores errors in server flash[:errors]
      render :new # renders back to new page, with filled in values for inputs
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
