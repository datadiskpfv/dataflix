require 'rails_helper'

RSpec.feature 'Users can create new films' do

  before do
    visit '/admin'
    click_link 'Create Film'
  end

  scenario 'with validate credentials' do
    fill_in 'Title', with: 'Alien'
    fill_in 'Description', with: 'A ScFi horror movie about a crew in deep space'
    select 'Horror', from: 'Genre1'
    select 'Action', from: 'Genre2'
    select '18', from: 'Rating'
    click_button 'Create Film'

    expect(page).to have_content 'Film has been created'
    expect(page).to have_content 'Alien'
    within('#genre1') do
      expect(page).to have_content 'Horror'
    end
    within('#genre2') do
      expect(page).to have_content 'Action'
    end
    within('#rating') do
      expect(page).to have_content '18'
    end
  end

  scenario 'when providing invalid attributes' do
    click_button 'Create Film'

    expect(page).to have_content 'Film has not been created.'
    expect(page).to have_content "Title can't be blank"
  end
end