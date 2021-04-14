require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:all) { @user = FactoryBot.create(:user) }

  describe 'GET /show' do
    it { should route(:get, user_path(@user)).to(action: :show, id: @user.id) }
  end
end
