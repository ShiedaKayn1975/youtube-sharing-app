class Api::V1::VideoSharingsController < Api::V1::ApiController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @video_sharings = VideoSharing.includes(:user).all
  end
  
  def create
    @video = @current_user.video_sharings.new(video_sharings_params)
    if @video.save
      return status_ok
    else
      return status_unprocessable_entity(@video)
    end
  end

  private

  def video_sharings_params
    params.permit(:video_url, :title, :thumbnail, :description, :video_id)
  end
end
