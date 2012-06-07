class ComicPostsController < ApplicationController
  def index
    @comic_posts = ComicPost.all
  end
  
  def show
    @comic_post = ComicPost.find(params[:id])
  end
end
