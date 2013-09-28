class PostsController < ApplicationController
  before_filter :signed_in_user,:only=>[:create,:destroy]
  
  def create
    @post=current_user.posts.create!(params[:post])
  end
  
  def intermediate
    if signed_in?
      @posts=posts
      @users=User.all
      @post= current_user.posts.build
    else
      redirect_to signin_path
    end
  end
  
  def night_mode
  end

  def day_mode
  end
  
  def index
    if signed_in?
      @post= current_user.posts.build
      @posts=posts
    else
      redirect_to signin_path,:notice => "Please sign in to participate in the game"
    end  
  end
    
  def destroy
  end
end
