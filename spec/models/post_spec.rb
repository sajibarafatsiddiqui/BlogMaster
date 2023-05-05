require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:commentscounter).only_integer.is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likescounter).only_integer.is_greater_than_or_equal_to(0) }
  end

  describe 'associations' do
    it { should belong_to(:author).with_foreign_key('author_id') }
    it { should have_many(:likes).with_foreign_key('post_id') }
    it { should have_many(:comments).with_foreign_key('post_id') }
  end
  describe '#first_three_post' do
    let(:user) { create(:user) }
    let!(:post1) { create(:post, author: user, created_at: 1.day.ago) }
    let!(:post2) { create(:post, author: user, created_at: 2.days.ago) }
    let!(:post3) { create(:post, author: user, created_at: 3.days.ago) }
    let!(:post4) { create(:post, author: user, created_at: 4.days.ago) }
    it 'returns the three most recent posts' do
      expect(post1.update_posts_counter(user)).to eq(4)
    end
  end
  describe '#five_recent_comments' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, author: user, created_at: 1.day.ago) }
    let!(:comment1) { create(:comment, post:, author: user, text: 'nice') }
    let!(:comment2) { create(:comment, post:, author: user, text: 'nice') }
    let!(:comment3) { create(:comment, post:, author: user, text: 'nice') }
    let!(:comment4) { create(:comment, post:, author: user, text: 'nice') }
    let!(:comment5) { create(:comment, post:, author: user, text: 'nice') }
    let!(:comment6) { create(:comment, post:, author: user, text: 'nice') }
    let!(:comment7) { create(:comment, post:, author: user, text: 'nice') }
    it 'returns the five most recent comments' do
      expect(post.last_five_comments).to eq([comment3, comment4, comment5, comment6, comment7])
    end
  end
end
