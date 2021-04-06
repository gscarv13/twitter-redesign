require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:full_name) }

    it { should validate_length_of(:username).is_at_least(3) }
    it { should validate_length_of(:full_name).is_at_least(3) }

    it { should validate_length_of(:username).is_at_most(20) }
    it { should validate_length_of(:full_name).is_at_most(20) }
  end

  context 'associations' do
    it { is_expected.to have_many(:posts) }
    it { is_expected.to have_many(:followers) }
    it { is_expected.to have_many(:followed) }
  end
end
