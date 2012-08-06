class UsersController < ApplicationController
  before_filter :signed_in_user,	only: [:index, :edit, :update]
  before_filter :creating_while_signed_in,	only: [:new, :create]
  before_filter :correct_user, 		only: [:edit, :update]
  before_filter :admin_user, 		only: :destroy

  
  def index 
	@users = User.paginate(page: params[:page])
  end	  
  
  def new
	@user = User.new
  end
  
  def show
	@user = User.find(params[:id])
	@videos = @user.videos.paginate(page: params[:page])
  end
  
  def edit
  end
  
  def create
	@user = User.new(params[:user])
  	if @user.save
	  sign_in @user
	  flash[:success] = "Welcome to the Sample App!"
	  redirect_to @user
	else
	  render 'new'
	end
  end
  
  def update
	if @user.update_attributes(params[:user])
	  flash[:success] = "Your profile has been updated"
	  sign_in @user			# We sign in as part of successful update because the remember token is reset when the user is saved; this allows a user to change login info and end any floating hijacked sessions
	  redirect_to @user
    else 
	  render 'edit'
	end
  end
  
  def destroy
	if (current_user.admin? && current_user == User.find(params[:id]))
	  redirect_to users_path, notice: "Try again to delete yourself, admin!"
	else
	  User.find(params[:id]).destroy
	  flash[:success] = "User destroyed."
	  redirect_to users_path
	end
  end
  
  private
  
    def signed_in_user
	  unless signed_in?
	    store_location
		redirect_to signin_path, notice: "Please sign in." 
	  end
	end
	
	def creating_while_signed_in
	  if signed_in?
	    redirect_to root_path, notice: "Sign out to create a new user!"
	  end
	end
	
	def correct_user
	  @user = User.find(params[:id])
	  redirect_to(root_path) unless current_user?(@user)
	end
	
	def admin_user
	  redirect_to root_path unless current_user.admin?
	end
end
