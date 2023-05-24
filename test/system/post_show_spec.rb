require 'rails_helper'

RSpec.feature 'Post show page', type: :feature do
  let(:author) { create(:user) }
  let(:post) { create(:post, author:) }
  let!(:comments) { create_list(:comment, 3, post:) }
  scenario "I can see the post's title and who wrote the post" do
    visit user_post_path(author, post)
    expect(page).to have_content(post.title)
    expect(page).to have_content(author.name)
  end
  scenario 'I can see how many comments it has' do
    visit user_post_path(author, post)
    expect(page).to have_content("Comments: #{post.commentscounter}")
  end
  scenario 'I can see how many likes it has' do
    visit user_post_path(author, post)
    expect(page).to have_content("Likes: #{post.likescounter}")
  end
  scenario 'I can see the post body' do
    visit user_post_path(author, post)
    expect(page).to have_content(post.text)
  end
  scenario 'I can see the username of each commenter' do
    visit user_post_path(author, post)
    comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end
  scenario 'I can see the comment each commentor left' do
    visit user_post_path(author, post)
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
