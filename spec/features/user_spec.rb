require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  it 'shows the menu of upcoming and past events' do
    visit users_path
    expect(page).to have_text('Users')
  end
end
