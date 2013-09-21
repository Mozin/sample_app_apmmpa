class StaticPagesController < ApplicationController
  def home
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
  
  def game
    if signed_in?
      @post= current_user.posts.build
      @posts=posts
    else
      redirect_to signin_path,:notice => "Please sign in to participate in the game"
    end
  end
end

