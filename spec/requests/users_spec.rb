require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /index http response' do
    it 'returns http success' do
      get '/users/'
      expect(response.status).to eq(200)
    end
  end
  describe 'GET /index template' do
    before { get '/users/' }
    it { should render_template('index') }
  end

  describe 'GET /users placeholder' do
    it 'includes proper placeholder text' do
      get '/users/'
      expect(response.body).to include('I am list of users')
    end
  end

  describe 'GET /show http response' do
    it 'returns http success' do
      get '/users/1'
      expect(response.status).to eq(200)
    end
  end

  describe 'GET /show template' do
    before { get '/users/1' }
    it { should render_template('show') }
  end

  describe 'GET /show placeholder' do
    it 'includes proper placeholder text' do
      get '/users/1'
      expect(response.body).to include('I am user with id provided as parameter')
    end
  end
end
