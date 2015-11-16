class PostsController < ApplicationController
  def index
   @posts = Post.all
  end

  def show

  end
  
  def create
    @post = new()
    Post.count +=1
  end

  def new
    @post = Post.new
  end

  def edit
  end
end
