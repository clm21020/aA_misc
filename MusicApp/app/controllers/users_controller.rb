class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create!(user_params)
    log_in_user!(@user)
    redirect_to user_url(@user.id)
  end

  def show
    @user = User.find_by_id(params[:id])
    render :show
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
