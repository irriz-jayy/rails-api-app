class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  enum status: { pending: 'pending', processing: 'processing', shipped: 'shipped', delivered: 'delivered' }
end
