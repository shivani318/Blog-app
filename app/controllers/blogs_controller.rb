class BlogsController < ApplicationController

  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.profile.present?
      @blogs = Blog.all
    else
      redirect_to root_path, notice: "Please create your profile first"
    end
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(blog_params)

    if @blog.save
      redirect_to blogs_url
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_url
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to root_path
  end

  private
    def blog_params
      params.require(:blog).permit(:name, :image, :description, :launch_date)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
