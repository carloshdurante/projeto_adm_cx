class Lider < ApplicationRecord
  belongs_to :company
  validates :nome, presence: true
end
