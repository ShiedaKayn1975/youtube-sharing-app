class Api::V1::VideoSharingsController < Api::V1::ApiController
  def index
    @video_sharings = VideoSharing.includes(:sources, :users).all
  end
  
  def create
    @video = VideoSharing.new(video_sharings_params)
    if @video.save
      return status_ok
    else
      return status_unprocessable_entity(@video)
    end
  end

  private

  def video_sharings_params
    params.permit(:video_url, :source_id)
  end
end
