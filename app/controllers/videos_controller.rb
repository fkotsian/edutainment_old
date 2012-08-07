class VideosController < ApplicationController
  def favorite
  end
  
  def index 
	if signed_in?
		@user = User.find(params[:user_id]) # or current_user, if not in URL (which may be)
		@videos = @user.videos.paginate(page: params[:page])		
		render 'users#feed'
	else
		@user = User.find(params[:id])
		@videos = @user.videos.paginate(page: params[:page])
	end
  end	  
  
  def new
	@user = User.find(params[:user_id])
	@video = @user.videos.build(views: 0)
  end
  
  def show
	@user = User.find(params[:id])
	@video = @user.video(params[:video_id])
  end
  
  def edit
  end
  
  def create
	@user = User.find(params[:user_id])
	@video = @user.videos.build(params[:video])
	if @video.save
	  flash[:success] = "Congrats on your new EduTainment!"
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
	  deleted_vid = Video.find(params[:id]).destroy
	  flash[:success] = "Video deleted."
	  redirect_to deleted_vid.user
	end
  end  
end
