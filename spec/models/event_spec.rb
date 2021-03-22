require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Event, type: :model do
  subject do
    described_class.new(description: 'Lorem ipsum',
                        date: DateTime.now,
                        user_id: 1)
  end

  it 'ensures description presence' do
    expect(subject).to be_invalid
  end

  context 'description validation' do
    it 'ensures description presence' do
      u = User.new(email: 'at@gmail.com')
      u.save
      expect(Event.new(description: 'Avengers', date: '1/1/2020', user_id: 1)).to be_invalid
    end
  end

  context 'description validation' do
    it 'ensures description presence' do
      expect(Event.new).to be_invalid
    end
  end

  context 'description validation' do
    it 'ensures description presence' do
      expect(Event.new(description: 'star wars')).to be_invalid
    end
  end

  describe 'Associations' do
    it { should belong_to(:creator) }
    it { should have_many(:attendees) }
    it { should have_many(:invitations) }
  end
end
