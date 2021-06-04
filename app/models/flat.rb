class Flat < ApplicationRecord
    validates :name, presence: :true
    validates :address, presence: :true
    validates :description, presence: :true
    validates :number_of_guests, presence: :true
    validates :url, presence: :true
    monetize :price_cents
    belongs_to :user
end
