class PostsController < ApplicationController
  def index
<<<<<<< HEAD
   @posts = Post.all
=======
    @posts = Post.all
>>>>>>> checkpoint_30
  end

  def show

  end

  def new
    @post = Post.new
  end

  def edit
  end
end
