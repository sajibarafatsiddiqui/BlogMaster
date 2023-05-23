require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let(:user1) { create(:user, bio: 'Do help Get Help') }
  let!(:posts) { create_list(:post, 5, author: user1) }

  scenario "I can see the user's profile picture, username, number of posts, and bio" do
    visit user_path(user1)
    expect(page).to have_css("img[src*='#{user1.photo}']")
    expect(page).to have_content(user1.name)
    expect(page).to have_content("Total number of posts: #{user1.postscounter}")
    expect(page).to have_content(user1.bio)
  end

  scenario "I can see the user's first 3 posts" do
    visit user_path(user1)
    user1.first_three_post.each do |post|
      expect(page).to have_content(post.text)
    end
  end

  scenario "I can see a button that lets me view all of a user's posts" do
    visit user_path(user1)
    expect(page).to have_link('show all posts', href: user_posts_path(user1))
  end

  scenario "When I click a user's post, it redirects me to that post's show page" do
    visit user_path(user1)
    first_post = user1.first_three_post.first
    find("##{first_post.id}", text: first_post.text).find(:xpath, '..').click
    expect(current_path).to eq(user_post_path(user1, first_post))
  end

  scenario "When I click to see all posts, it redirects me to the user's post's index page" do
    visit user_path(user1)
    click_on 'show all posts'
    expect(current_path).to eq(user_posts_path(user1))
  end
end
