require 'rails_helper'
require_relative '../support/user_support'

RSpec.feature 'Post', type: :feature do
  before(:all) do
    @elliot = FactoryBot.create(:user)
    @darlene = FactoryBot.create(:user)
    log_in(@elliot)
  end

  scenario 'Post should be successful' do
    within('form') do
      fill_in 'Post something', with: 'This is a capybara test'
    end

    click_on('Create Post')
    expect(page).to have_content('This is a capybara test')
  end
end
