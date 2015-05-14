class SubsController < ApplicationController
  before_action :only_moderator_can_edit, only: [:edit, :update]

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    if @sub.update(sub_params)
      redirect_to @sub
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find(params[:id])
    @sub.delete
    redirect_to :index
  end

  private

    def sub_params
      params.require(:sub).permit(:title, :description)
    end

    def only_moderator_can_edit
      unless current_user.id == Sub.find(params[:id]).moderator_id
        flash[:errors] = "Only the moderator can edit"
        redirect_to Sub.find(params[:id])
      end
    end
end
