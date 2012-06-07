class Admin::ComicPostsController < ApplicationController
  before_filter :authenticate
  before_filter :admin_user

  def index
    @comic_posts = ComicPost.all
  end

  def show
    @comic_post = ComicPost.find(params[:id])
  end

  def new
    @comic_post = ComicPost.new
  end

  def edit
    @comic_post = ComicPost.find(params[:id])
  end

  def create
    @comic_post = ComicPost.new(params[:comic_post])
    @comic_post.comic = params[:comic]
    if @comic_post.save
      redirect_to admin_path, :flash => { :success => "Comic successfully posted" }
    else
      render 'new', :flash => { :failure => "Comic was not successfully posted" }
    end
  end

  def update
    @comic_post = ComicPost.find(params[:id])
    if @comic_post.save
      redirect_to admin_path, :flash => { :success => "Comic successfully updated" }
    else
      render 'edit', :flash => { :failure => "Comic was not successfully updated" }
    end
  end

  def destroy
    @comic_post = ComicPost.find(params[:id])
    @comic_post.destroy
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def admin_user
      redirect_to(root_path) unless is_admin?
    end
end
