
class SessionsController < ApplicationController

  def new
    # @user = User.new
    render :new
  end

  def create
    # actually logging, creating a new session
    # finding the user

    @user = User.find_by_credentials(params[:user][:username],params[:user][:password])

    if @user
      login!(@user)
      redirect_to user_url(@user)
      # do something
    else
      flash[:errors] = ['Invalid Login Credentials. Boo.']
      render :new
      # render them back to new, show errors?
    end
  end


  def destroy
    logout!
    redirect_to new_session_url
  end

end
