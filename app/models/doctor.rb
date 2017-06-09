class Doctor < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
  validates :gender, presence: true

  scope :male, -> { where(gender: 'male') }
  scope :female, -> { where(gender: 'female') }

end
