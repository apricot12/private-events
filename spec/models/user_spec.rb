require 'rails_helper'
require 'capybara/rails'

RSpec.describe User, type: :model do
  context 'validation test' do
    it 'ensures email presence' do
      user = User.new(email: 'sample@example.com').save
      expect(user).to eq(false)
    end
  end

  describe 'Associations' do
    it { should have_many(:created_events) }
    it { should have_many(:invitations) }
    it { should have_many(:attended_events) }
  end
end
