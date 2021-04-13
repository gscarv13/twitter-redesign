require 'rails_helper'
require_relative '../support/user_support'

def variables
  @elliot = FactoryBot.create(:user)
  @darlene = FactoryBot.create(:user)
end

RSpec.feature 'Sign in', type: :feature do
  before(:all) { variables }
  before(:each) { log_in(@elliot) }

  scenario 'Sign in should be successful' do
    expect(page).to have_content('Posts')
    expect(page).to have_content('WHO TO FOLLOW')
    expect(page).to have_content(@elliot.full_name)
  end
end

RSpec.feature 'Follow system', type: :feature do
  before(:all) { variables }
  before(:each) { log_in(@elliot) }

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

RSpec.feature 'Navigation system', type: :feature do
  before(:all) { variables }
  before(:each) { log_in(@elliot) }

  scenario 'Visit profile page should be successful' do
    click_on('Profile')

    within('.suggestion') do
      expect(page).to have_content @elliot.full_name
      expect(page).to have_content @elliot.username
    end
  end

  scenario 'Visit user profile page should be successful' do
    within('.suggestion') { click_on(@darlene.full_name) }

    within('.suggestion') do
      expect(page).to have_content @darlene.full_name
      expect(page).to have_content @darlene.username
    end
  end
end
