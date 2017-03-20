require 'rails_helper'

RSpec.feature ' Users can delete genres' do

  let(:admin_user) { FactoryGirl.create(:user, :admin)}
  let!(:genre) { FactoryGirl.create(:genre, genre: 'Dataflix_ScFi') }

  before do
    login_as(admin_user)
  end

  scenario 'with valid credentials' do
    visit genres_path
    click_link 'delete_Dataflix_ScFi'

    expect(page).to have_content 'Horror'
    expect(page).not_to have_content 'Dataflix_ScFi'
  end
end