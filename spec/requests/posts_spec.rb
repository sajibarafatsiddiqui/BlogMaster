require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before { get :index, params: { user_id: 1 } }
  it { should respond_with(200) }
end

RSpec.describe PostsController, type: :controller do
  it { should route(:get, 'users/1/posts').to(action: :index, user_id: 1) }
  it { should route(:get, 'users/1/posts/1').to(action: :show, id: 1, user_id: 1) }
end

RSpec.describe PostsController, type: :controller do
  before { get :index, params: { user_id: 1 } }
  it { should render_template('index') }
end

RSpec.describe PostsController, type: :controller do
  describe 'GET /users/:user_id/posts' do
    it 'returns http success' do
      get :index, params: { user_id: 1 }
      expect(response.body).to include('I am users posts')
    end
  end
end

RSpec.describe PostsController, type: :controller do
  before { get :index, params: { user_id: 1, id: 1 } }
  it { should respond_with(200) }
end

RSpec.describe PostsController, type: :controller do
  before { get :show, params: { user_id: 1, id: 1 } }
  it { should render_template('show') }
end

RSpec.describe PostsController, type: :controller do
  describe 'GET /users/:user_id/posts' do
    it 'returns http success' do
      get :show, params: { user_id: 1, id: 1 }
      expect(response.body).to include('I am users post by id')
    end
  end
end
