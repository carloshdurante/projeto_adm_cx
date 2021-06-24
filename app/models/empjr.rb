class Empjr < ApplicationRecord
  belongs_to :coordenador
  belongs_to :company
  validates :nome, presence: true
end
