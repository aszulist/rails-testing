require 'rails_helper'

RSpec.describe 'Achievements API', type: :request do
  let(:user) { FactoryGirl.create(:user) }
  it 'sends public achievements' do
    public_achievement = FactoryGirl.create(:public_achievement, title: 'My achievement', user: user)
    private_achievement = FactoryGirl.create(:private_achievement, user: user)

    get '/api/achievements', nil, { 'Content-Type': 'application/vnd.api+json' }

    expect(response.status).to eq(200)
    json = JSON.parse(response.body)
    expect(json.count).to eq(1)
    expect(json[0]['title']).to eq('My achievement')
  end
end