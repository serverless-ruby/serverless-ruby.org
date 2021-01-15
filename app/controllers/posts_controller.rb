class PostsController < ApplicationController
  before_action :authenticate, except: [:show, :index]
  before_action :find_post, except: [:new, :index, :create]
  before_action :authorize, except: [:new, :index, :create, :show]

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
    @post.user = current_user

    if @post.save
      PostList.add!(@post)
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
    PostList.remove!(@post)
    redirect_to posts_path
  end

  private
    def set_fields
      post_params = params.require(:post).permit(:title, :description, :url)

      # This is due to a bug in Dynamoid gem where we cannot set attributes via @post.attributes = {}
      @post.title = post_params[:title]
      @post.description = post_params[:description]
      @post.url = post_params[:url]
      @post.set_graph_data
    end

    def find_post
      @post = Post.find(params[:id]) #find by public_uid
    end

    def authorize
      raise NotAuthorized unless current_user.dude.able_to_update_post?(@post)
    end
end
