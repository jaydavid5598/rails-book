class Book < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'

  validates :title, presence: true
  validates :description, presence: true
end
