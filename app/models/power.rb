class Power < ApplicationRecord
    has_many :hero_powers
    has_many :heroes, through: :hero_powers
    validates :description, presence: true
    validates :description, length: {minimum: 20}
end
