require 'rails_helper'

RSpec.feature ' Users can edit genres' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let!(:genre) { FactoryGirl.create(:genre, genre: 'Dataflix') }

  before do
    login_as(admin_user)
  end

  scenario 'with valid credentials' do
    visit genres_path
    click_link 'edit_Dataflix'

    fill_in 'Genre', with: 'Dataflix_ScFi'
    click_button 'Update Genre'

    expect(page).to have_content 'Genre has been updated.'
    expect(page).to have_content 'Dataflix_ScFi'

    visit genres_path
    click_link 'delete_Dataflix_ScFi'
  end
end