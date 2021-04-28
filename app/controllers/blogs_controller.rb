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
      respond_to do |format|
        # format.html { edirect_to blogs_url, notice: 'Blog was successfully created' }
        format.js
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      respond_to do |format|
      # format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed'}
        format.js
      end
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    respond_to do |format|
      # format.html { redirect_to root_path, notice: 'Blog was successfully destroyed'}
      format.js
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:name, :image, :description, :launch_date)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end
end
