FactoryBot.define do
  factory :video_sharing do
    thumbnail { FFaker::Youtube.url }
    title { FFaker::Movie.title }
    description { FFaker::Book.description }
    video_id { FFaker::Youtube.video_id }
  end
end
