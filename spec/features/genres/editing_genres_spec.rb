require 'rails_helper'

RSpec.feature ' Users can edit genres' do

  scenario 'with valid credentials' do
    ## removed as I have seeded the data
    genre = FactoryGirl.create(:genre, genre: 'Dataflix')

    visit '/genres'
    click_link 'edit_Dataflix'

    fill_in 'Genre', with: 'Dataflix_ScFi'
    click_button 'Update Genre'

    expect(page).to have_content 'Genre has been updated.'
    expect(page).to have_content 'Dataflix_ScFi'

    visit '/genres'
    click_link 'delete_Dataflix_ScFi'
  end
end