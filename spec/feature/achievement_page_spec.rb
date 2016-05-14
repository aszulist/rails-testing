require 'rails_helper'

feature 'achievement page' do
  scenario 'achievement public page' do
    user = FactoryGirl.create(:user)
    achievement = FactoryGirl.create(:achievement, title: 'Just did it', user: user)
    visit("/achievements/#{achievement.id}")

    expect(page).to have_content('Just did it')
  end

  scenario 'render markdown description' do
    user = FactoryGirl.create(:user)
    achievement = FactoryGirl.create(:achievement, description: 'That *was* hard', user: user)
    visit("/achievements/#{achievement.id}")

    expect(page).to have_css('em', text: 'was')
  end
end