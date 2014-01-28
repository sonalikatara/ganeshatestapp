class UsersController < ApplicationController

 before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
 before_action :correct_user,   only: [:edit, :update]
 before_action :admin_user, only: :destroy

  def new
     @user = User.new
  end

  def show
     @user = User.find(params[:id])
     @microposts = @user.microposts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
       # Tell the UserMailer to send welcome message
       UserMailer.welcome_email(@user).deliver

       sign_in @user
       flash[:success] = "Welcome to the LETS TALK !"
       redirect_to @user
    else
      render 'new'
    end
  end 

   def edit
     @user = User.find(params[:id])
   end
 
   def update
     @user = User.find(params[:id])
     if @user.update_attributes(user_params)
        flash[:sucess] = "Profile updates"
        redirect_to @user
     else
        render 'edit'
     end
   end


  def index
     # @users = User.all  // displays all users at a time 
    
     # for pagination we use will_paginate that requires using paginate method
     # here the :page parameter comes from params[:page], which is generated automatically by will_paginate
     @users = User.paginate(page: params[:page])

  end

   def destroy
     User.find(params[:id]).destroy
     flash[:sucess] = "User deleted."
     redirect_to users_url
   end

 private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

   # before filters

  
   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end

   def admin_user
      redirect_to(root_url) unless current_user.admin?
   end 

end
