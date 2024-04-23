require 'rails_helper'

RSpec.describe VideoSharing, type: :model do
  it { should belong_to(:user) }

  context 'after create' do
    let(:user) { FactoryBot.build(:user) }
    let(:video_sharing) { FactoryBot.build(:video_sharing, user: user) }

    it "calls create_notification after create" do
      allow(video_sharing).to receive(:create_notification)
      video_sharing.save!
      expect(video_sharing).to have_received(:create_notification)
    end
  end
end