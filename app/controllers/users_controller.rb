class UsersController < ApplicationController
  before_filter :signed_in_user,:only=> [:edit,:update]
  before_filter :correct_user,:only=> [:edit,:update]
  before_filter :admin_user,:only=> :destroy
  
  def new
    @user=User.new
  end
  
  def allocate
    n=User.count
    fake_names='Wolverine ProfessorX Rogue JeanGrey Cyclops Storm Iceman  Magneto Mystique Stryker Pyro Electro Deadpool Sabertooth Juggernaut Beast Bolt Gambit Frost Zero'.split
    game_characters='Mafia Don Villager Police Doctor'.split
    @users=User.all
    @users.each do |user|
      if user.admin?
        user.update_attribute('fake_name','Moderator')
        user.update_attribute('game_character','Moderator')
      else
        user.update_attribute('fake_name',fake_names.sample)
        user.update_attribute('game_character',game_characters.sample)
      end
    end
   sign_in User.find(params[:id])
   redirect_to intermediate_path
  end
        
  def create 
    @user=User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success]="Welcome to Mafia"
      redirect_to root_path
    else
      render 'new'  
    end
  end
  
  def edit
  end
  
  def change_join_status
    user=User.find(params[:id])
    user.toggle!(:game_join_status)
    sign_in user
    flash[:success]="Welcome to the game"
    redirect_to intermediate_path
  end
  
  def change
    user=User.find(params[:id])
    user.toggle!(:live_status)
    user.update_attribute('fake_name',nil)
    redirect_to posts_path
  end
  
  def change_last_words_status
    user=User.find(params[:id])  
    user.update_attribute('last_words',true)
    redirect_to posts_path        
  end
    
  def show
    @user=User.find(params[:id])
  end
  
  def update
    if @user.update_attributes(params[:user])
      flash[:success] ="profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def index
    @users=User.all
  end
  
  def destroy
    user=User.find(params[:id])
    flash[:success]="User #{user.name} destroyed"
    user.destroy
    redirect_to posts_path
  end 
  
  def kill
    redirect_to users_path
  end
  
  private
  

  	  def correct_user
  	    @user=User.find(params[:id])
  	    redirect_to root_path,:notice=>"You are not authorized to access other users profile" unless current_user?(@user) || current_user.admin?
  	  end	
  	  
  	  def admin_user 
  	    redirect_to (root_path) unless current_user.admin?
  	  end
end
