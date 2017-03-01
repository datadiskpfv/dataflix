require 'rails_helper'

RSpec.feature ' Users can delete genres' do

  scenario 'with valid credentials' do

    genre1 = FactoryGirl.create(:genre, genre: 'Horror')
    genre2 = FactoryGirl.create(:genre, genre: 'ScFi')

    visit '/genres'
    click_link 'delete_ScFi'

    expect(page).to have_content 'Horror'
    expect(page).not_to have_content 'ScFi'
  end
end