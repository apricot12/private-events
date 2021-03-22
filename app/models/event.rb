class Event < ApplicationRecord
  validates :description, presence: true
  validates :date, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :invitations
  has_many :attendees, through: :invitations, source: :user

  scope :past, -> { where('date < ?', Date.current) }
  scope :upcoming, -> { where('date >= ?', Date.current) }
end
