class InstructionStep < ApplicationRecord
  belongs_to :recipe

  validates :order, presence: true
  validates :text, presence: true

  default_scope { order(:order) }
end
