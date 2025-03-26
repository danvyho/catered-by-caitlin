class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  has_many :instruction_steps, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :servings, presence: true
end
