require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end
  describe 'like counter' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, author: user) }
    let!(:like1) { create(:like, author: user, post:) }
    let!(:like2) { create(:like, author: user, post:) }
    let!(:like3) { create(:like, author: user, post:) }
    it 'should return the total like' do
      expect(like1.update_likes_counter).to eq(3)
    end
  end
end
