require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User') }
    it { should belong_to(:post) }
  end

  describe 'comment counter' do
    let(:user) { create(:user) }
    let!(:post) { create(:post, author: user) }
    let!(:comment1) { create(:comment, author: user, post:) }
    let!(:comment2) { create(:comment, author: user, post:) }
    let!(:comment3) { create(:comment, author: user, post:) }
    it 'should return the total comment' do
      expect(comment1.update_comments_counter).to eq(3)
    end
  end
end
