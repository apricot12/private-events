require 'rails_helper'

RSpec.describe 'Create Event', type: :feature do
  # happy path scenario block
  # scenario 'valid title and url' do
  #   visit new_event_path
  #   # fill in text fields with specified string
    
  #   fill_in 'date', with: '1/1/2020'
  #   click_button 'Create Event'
    
  #   # The page should show success message
  #   expect(page).to have_content("Your event has been created")
  # end
  it 'shows the menu of upcoming and past events' do
    visit new_event_path
    expect(page).to have_text('Description')
  end
end