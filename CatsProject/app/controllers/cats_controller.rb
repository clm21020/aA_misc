class CatsController < ApplicationController
  def index
    @cats = Cat.all
    render :index
  end

  def show
    @cat = Cat.find(params[:id])
    render :show
  end

  def new
    @cat = Cat.new
    render :new
  end

  def update
    Cat.update(params[:id], cat_params)
    redirect_to cat_url(params[:id])
  end

  def create
    Cat.create!(cat_params)

    redirect_to cats_url
  end

  def edit
    @cat = Cat.find(params[:id])
    render :edit
  end

  private

  def cat_params
    params.require(:cat).permit(:name, :birth_date, :color, :sex, :description)
  end
end
