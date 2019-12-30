class Profile < ApplicationRecord
  belongs_to :user

  validates :age, :gender, :last_name, :first_name, :height, :weight, :foot_size, :address, :skill, :favorite_food, :introduction, presence: true
end
