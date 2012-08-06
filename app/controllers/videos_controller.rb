class VideosController < ApplicationController
  def favorite
  end
  
  def index 
	@videos = Videos.paginate(page: params[:page])
  end	  
  
  def new
	@user = current_user
	@video = Video.new(params[:video], user: @user)
  end
  
  def show
	if signed_in?
		@user = User.find(params[:id]) # or current_user, if not in URL (which may be)
		@videos = @user.videos.paginate(page: params[:page])		
		render 'users#feed'
	else
		@user = User.find(params[:id])
		@videos = @user.videos.paginate(page: params[:page])
	end
  end
  
  def edit
  end
  
  def create
	@user = current_user
	@video = Video.new(params[:video], user: current_user, views: 0)
  	if @video.save
	  flash[:success] = "Welcome to EduTainment!"
	  redirect_to @video.user
	else
	  flash[:error] = params[:video]
	  render 'new'
	end
  end
  
  def update
	if @video.update_attributes(params[:video])
	  flash[:success] = "Your video has been updated"
	  redirect_to @video.user
    else 
	  render 'edit'
	end
  end
  
  def destroy
	if (current_user.admin? && current_user == User.find(params[:id]))
	  redirect_to users_path, notice: "Try again to delete yourself, admin!"
	else
	  Video.find(params[:id]).destroy
	  flash[:success] = "Video deleted."
	  redirect_to @video.user
	end
  end  
end
