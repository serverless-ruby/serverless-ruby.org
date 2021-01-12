class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:show, :index]

  def index
    @posts = PostList.latest_posts
  end

  def show
    render :show
  end

  def new
    @post = Post.new
    render :form
  end

  def create
    @post = Post.new
    set_fields

    if @post.save
      redirect_to post_path(@post)
    else
      render :form, status: 422
    end
  end

  def edit
    render :form
  end

  def update
    set_fields

    if @post.save
      redirect_to post_path(@post)
    else
      render :form, status: 422
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private
    def set_fields
      post_params = params.require(:post).permit(:title, :description)

      # This is due to a bug in Dynamoid bug where we cannot set attributes via @post.attributes = {}
      @post.title = post_params[:title]
      @post.description = post_params[:description]
    end

    def find_post
      @post = Post.find(params[:id]) #find by public_uid
    end
end
