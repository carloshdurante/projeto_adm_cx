class Fundador < ApplicationRecord
    validates :nome, presence: true
    has_many :company, dependent: :destroy
end
