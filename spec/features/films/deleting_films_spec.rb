require 'rails_helper'

RSpec.feature ' Users can delete films' do

  scenario 'with valid credentials' do

    film1 = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')
    film2 = FactoryGirl.create(:film, title: 'Ghost Train', description: 'Another good film')

    visit '/'
    click_link 'Ghost Train'
    click_link 'Delete Film'

    expect(page).to have_content 'Alien'
    expect(page).not_to have_content 'Ghost Train'
  end
end