class Product < ApplicationRecord

    validates :brand, :name, :description, :image_url, :price, :stock , :color, :size, presence: true
    validates :name, uniqueness: true
end
