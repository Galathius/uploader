class VideosController < ApplicationController
  def index
    @new_video = Video.new
    @videos = current_user.videos
  end

  def create
    @video = current_user.videos.new(video_param)

    if @video.save
      redirect_to videos_path, notice: 'Video has been uploaded'
    else
      redirect_to videos_path, error: 'Something wrong'
    end
  end

protected
  def video_param
    params.require(:video).permit(:name, :video)
  end
end
