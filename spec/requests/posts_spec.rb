require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET posts#index' do
    before { get :index }

    it { should respond_with(200) }
    it { should route(:get, '/posts').to(action: :index) }
  end
end
