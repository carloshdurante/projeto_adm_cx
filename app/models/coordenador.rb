class Coordenador < ApplicationRecord
  belongs_to :lider
  belongs_to :company
  validates :nome, presence: true
  has_many :empjr, dependent: :destroy
  has_many :empsr, dependent: :destroy
end
