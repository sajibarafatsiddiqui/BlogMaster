require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it { should route(:get, 'users').to(action: :index) }
  it { should route(:get, 'users/1').to(action: :show, id: 1) }
end

RSpec.describe UsersController, type: :controller do
  before { get :index }
  it { should respond_with(200) }
end

RSpec.describe UsersController, type: :controller do
  before { get :index }
  it { should render_template('index') }
end

RSpec.describe UsersController, type: :controller do
  describe 'GET /users' do
    it 'returns http success' do
      get :index
      expect(response.body).to include('I am list of users')
    end
  end
end

RSpec.describe UsersController, type: :controller do
  before { get :index, params: { id: 1 } }
  it { should respond_with(200) }
end

RSpec.describe UsersController, type: :controller do
  before { get :show, params: { id: 1 } }
  it { should render_template('show') }
end

RSpec.describe UsersController, type: :controller do
  describe 'GET /users/:user_id' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response.body).to include('I am user with id provided as parameter')
    end
  end
end
