require 'rails_helper'

RSpec.feature ' Users can delete genres' do

  let!(:genre) { FactoryGirl.create(:genre, genre: 'Dataflix_ScFi') }

  scenario 'with valid credentials' do
    visit genres_path
    click_link 'delete_Dataflix_ScFi'

    expect(page).to have_content 'Horror'
    expect(page).not_to have_content 'Dataflix_ScFi'
  end
end