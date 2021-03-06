class Jar < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :user

  validates :name, presence: true

  scope :newest_first, -> {order('created_at DESC')}
  scope :oldest_first, -> {order('created_at ASC')}
  scope :closed, -> {where(closed: true)}
end
