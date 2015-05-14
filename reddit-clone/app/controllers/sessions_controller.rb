class SessionsController < ApplicationController

  def new
    @user = User.new

  end

  def create
    @user = User.find_by_credentials(session_params)
    if @user
      log_in_user!(@user)
      redirect_to @user
    else
      flash.now[:errors] = "Invalid username/password combination"
      render :new
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

  private

    def session_params
      params.require(:session).permit(:username, :password)
    end
end
