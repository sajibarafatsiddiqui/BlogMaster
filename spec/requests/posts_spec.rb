require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /index http response' do
    it 'returns http success' do
      get '/users/1/posts/'
      expect(response.status).to eq(200)
    end
  end
  describe 'GET /index template' do
    before { get '/users/1/posts/' }
    it { should render_template('index') }
  end

  describe 'GET /index placeholder text' do
    it 'includes proper placeholder text' do
      get '/users/1/posts/'
      expect(response.body).to include('I am users posts')
    end
  end

  describe 'GET /show http response' do
    it 'returns http success' do
      get '/users/1/posts/01'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show template' do
    before { get '/users/1/posts/1' }
    it { should render_template('show') }
  end

  describe 'GET /show placeholder text' do
    it 'includes proper placeholder text' do
      get '/users/1/posts/1'
      expect(response.body).to include('I am users post by id')
    end
  end
end
