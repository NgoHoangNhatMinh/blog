class BlogPostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy]
  def index
    @posts = BlogPost.all
  end

  def show
  end

  def new
    @post = BlogPost.new
  end

  def create
    @post = BlogPost.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to blog_posts_path
  end

  private
    def set_post
      @post = BlogPost.find(params[:id])
    end

    def post_params
      params.expect(blog_post: [ :title, :body ])
    end
end
