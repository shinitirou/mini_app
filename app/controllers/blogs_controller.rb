class BlogsController < ApplicationController

  def index
    @blogs=Blog.order("created_at DESC").page(params[:page]).per(5)
  end

  def new
  end


  def create
    Blog.create(text: blogs_params[:text],user_id: current_user.id)
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy if blog.user_id == current_user.id
  end

  def edit
    @blog = Blog.find(params[:id])
  end


  def update
    blog=Blog.find(params[:id])
    if blog.user_id == current_user.id
      blog.update(blogs_params)
    end
  end


  private
  def blogs_params
    params.permit(:text, :user_id)
  end


end
