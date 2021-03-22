require 'rails_helper'

RSpec.describe "UserSignIns", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'signs in valid user' do
    user = User.create(email: 'testuser@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_text("Signed in successfully.")
  end

  it 'sings out when signed in' do
    user = User.create(email: 'testuser@email.com', password: '123456')
    visit root_path
    click_link_or_button 'Sign in'
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to have_text("Signed in successfully.")
    click_button 'Sign out'
    expect(page).to have_text("Signed out successfully.")
  end
end
