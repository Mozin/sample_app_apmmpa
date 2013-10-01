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
    @users=User.all
    @users.each do |user|
      user.update_attribute('mode_status',false)    
    end
  end

  def deactivate
  end
  
  def day_mode
    @post= current_user.posts.build
    @users=User.all
    @users.each do |user|
      user.update_attribute('mode_status',true)    
    end
  end
  
  def status_update
    respond_to do |format|
      format.js
    end
  end
  
  def talk_mafias
    @post= current_user.posts.build
  end

  def talk_police
    @post= current_user.posts.build
  end

  def talk_don
    @post= current_user.posts.build
  end

  def talk_doc
    @post= current_user.posts.build
  end

  def index
    if signed_in?
      @post= current_user.posts.build
      @posts=posts
      @users=User.all
    else
      redirect_to signin_path,:notice => "Please sign in to participate in the game"
    end  
  end
    
  def destroy
  end
end
