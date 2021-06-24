class Company < ApplicationRecord
  belongs_to :fundador
  validates :nome, presence: true
end
