require 'rails_helper'

RSpec.feature 'Users can view films' do

  scenario 'with the film details' do
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')

    visit '/'
    click_link 'Alien'
    expect(page.current_url).to eq film_url(film)
  end
end