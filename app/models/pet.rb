class Pet < ApplicationRecord
    belongs_to :user
    validates :name, presence: true, length: { maximum: 255 }
    has_many :records, dependent: :destroy
    mount_uploader :img, ImgUploader
end
