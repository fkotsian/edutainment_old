class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email])
	if user && user.authenticate(params[:session][:password])
	  sign_in user
	  redirect_back_or user
	else
	  flash.now[:error] = 'Invalid email/password combination'
	  render 'new'
	end
  end
  
  def destroy
    sign_out
	redirect_to root_path
  end
  
  # These are the Rails actions that are mapped to in the Routes (match '/signin' to '/sessions#new', ...), which also specify the URI path to reach this action.
end