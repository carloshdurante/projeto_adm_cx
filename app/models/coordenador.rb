class Coordenador < ApplicationRecord
  belongs_to :lider
  belongs_to :company
  validates :nome, presence: true
end
