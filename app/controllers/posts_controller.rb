class PostsController < ApplicationController

  def new
    @post = Post.new
    @post.place_id = params["place_id"]
  end

  def create
    if @current_user
      @post = Post.new(params["post"])
      @post.save
    else
      flash[:notice] = "Login first."
    end
    redirect_to "/places/#{@post.place.id}"
  end

end
