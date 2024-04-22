require 'rails_helper'

RSpec.describe VideoSharing, type: :model do
  it { should belong_to(:user) }

  it "calls create_notification after create" do
    allow(subject).to receive(:create_notification)
    
    let(:user) { build(:user) }
    let(:video_sharing) { build(:video_sharing, user: user) }
    post = VideoSharing.create(title: "My Post")

    expect(subject).to have_received(:create_notification)
  end
end