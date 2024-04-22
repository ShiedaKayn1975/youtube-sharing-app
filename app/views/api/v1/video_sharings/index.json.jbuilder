# frozen_string_literal: true

json.status :success
json.data @video_sharings do |video_sharing|
  json.(video_sharing, :id, :video_url, :thumbnail, :title, :description, :video_id)
  
  json.creator do
    json.id video_sharing.user.id
    json.name video_sharing.user.name
  end
end
