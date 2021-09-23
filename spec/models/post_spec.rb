require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'validations' do
    it { should validate_presence_of(:text) }
    it { should validate_length_of(:text).is_at_least(10) }
    it { should validate_length_of(:text).is_at_most(200) }
  end

  context 'associations' do
    it { is_expected.to belong_to(:author) }
  end
end
