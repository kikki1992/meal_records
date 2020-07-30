class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, uniqueness: true,length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  
  has_many :pets
  has_many :relationships
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'pet_id'
  has_many :owners, through: :reverses_of_relationship, source: :user
  
end
