class Lider < ApplicationRecord
  belongs_to :company
  validates :nome, presence: true
  has_many :coordenador, dependent: :destroy
end
