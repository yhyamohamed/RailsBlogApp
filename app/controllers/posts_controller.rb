class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :populate_post, only: %i[edit update destroy show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: "post created !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end
  def edit

  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "post updated !"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    authorize @post, :delete?
    @post.destroy
    redirect_to posts_path, notice: "post deleted !"
  end
  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def populate_post
    @post = Post.find(params[:id])
  end
end
