require 'rails_helper'

RSpec.feature 'User post index page', type: :feature do
  let(:user1) { create(:user) }
  let!(:posts) { create_list(:post, 5, author: user1) }

  scenario "I can see the user's profile picture and the user's name and number of posts" do
    visit user_posts_path(user1)
    expect(page).to have_css("img[src*='#{user1.photo}']").and have_content(user1.name)
      .and have_content("Total number of posts: #{user1.postscounter}")
  end

  scenario "I can see a post's title and body, number of posts and comments and pagination section" do
    visit user_posts_path(user1)
    posts.each do |post|
      expect(page).to have_content(post.title).and have_content(post.text.truncate(100))
        .and have_content("Comments: #{post.comments.count}")
        .and have_content("Likes: #{post.likes.count}")
        .and have_button('Pagination')
    end
  end

  scenario 'I can see the first comments on a post' do
    visit user_posts_path(user1)
    posts.each do |post|
      post.last_five_comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end
  end

  scenario "When I click on a post, it redirects me to that post's show page" do
    visit user_posts_path(user1)
    first_post = posts.first
    find("##{first_post.id}", text: first_post.text).find(:xpath, '..').click
    expect(current_path).to eq(user_post_path(user1, first_post))
  end
end
