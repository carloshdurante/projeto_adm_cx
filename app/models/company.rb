class Company < ApplicationRecord
  belongs_to :fundador
  validates :nome, presence: true
  has_many :coordenador, dependent: :destroy
  has_many :lider, dependent: :destroy
  has_many :empjr, dependent: :destroy
  has_many :empsr, dependent: :destroy
  
end
