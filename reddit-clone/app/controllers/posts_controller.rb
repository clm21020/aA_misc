class PostsController < ApplicationController
  before_action :only_author_can_edit, only: [:edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    PostSub.create(post: @post, sub_id: params[:sub_id])

    if @post.save
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to :index
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :url, sub_ids: [])
    end

    def only_author_can_edit
      unless current_user.id == Post.find(params[:id]).author_id
        flash[:errors] = "Only the author can edit"
        redirect_to Post.find(params[:id])
      end
    end
end
