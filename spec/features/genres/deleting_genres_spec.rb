require 'rails_helper'

RSpec.feature ' Users can delete genres' do

  scenario 'with valid credentials' do

    genre1 = FactoryGirl.create(:genre, genre: 'Dataflix_ScFi')

    visit '/genres'
    click_link 'delete_Dataflix_ScFi'

    expect(page).to have_content 'Horror'
    expect(page).not_to have_content 'Dataflix_ScFi'
  end
end