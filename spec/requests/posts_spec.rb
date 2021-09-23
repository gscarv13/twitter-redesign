require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET posts#index' do
    before { get :index }

    it { should respond_with(302) }
    it { should route(:get, '/').to(action: :index) }
    it { should redirect_to(new_user_session_path) }
  end
end
