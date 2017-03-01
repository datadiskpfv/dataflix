require 'rails_helper'

RSpec.feature ' Users can edit films' do

  scenario 'with valid credentials' do
    film = FactoryGirl.create(:film, title: 'Alien', description: 'A good film')

    visit '/'
    click_link 'Alien'
    click_link 'Edit Film'

    fill_in 'Description', with: 'A very good film'
    click_button 'Update Film'

    expect(page).to have_content 'Film has been updated.'
    expect(page).to have_content 'A very good film'
  end
end