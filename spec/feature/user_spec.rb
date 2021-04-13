require 'rails_helper'
require_relative '../support/user_support'

RSpec.feature 'User', type: :feature do
  before(:all) do
    @elliot = FactoryBot.create(:user)
    @darlene = FactoryBot.create(:user)
  end

  before(:each) { log_in(@elliot) }

  scenario 'Log in should be successful' do
    expect(page).to have_content('Posts')
    expect(page).to have_content('WHO TO FOLLOW')
    expect(page).to have_content(@elliot.full_name)
  end

  scenario 'Follow should be successful' do
    click_on(@darlene.full_name)

    click_on(id: 'follow')
    expect(page).to have_content('Following dood!')
  end

  scenario 'Unfollow should be successful' do
    click_on(@darlene.full_name)

    click_on(id: 'follow')
    click_on(id: 'unfollow')
    expect(page).to have_content('Not a follower anymore dood!')
  end
end