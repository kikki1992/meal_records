class Record < ApplicationRecord
  
  belongs_to :pet
  
  validates :food_amount,presence: true
  validates :date,presence: true
  
end
