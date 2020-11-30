class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :book_id
end
