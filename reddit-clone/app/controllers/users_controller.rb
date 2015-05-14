class UsersController < ApplicationController
  before_action :find_or_initialize_user

  def show

  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in_user!(@user)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def destroy
    @user.delete
    redirect_to new_user_url
  end

  private

    def user_params
      params.require(:user).permit(:username, :password)
    end

    def find_or_initialize_user
      @user = params[:id] ? User.find(params[:id]) : User.new
    end
end
