class Payment < ApplicationRecord
  belongs_to :client
  belongs_to :currency
  has_many :discounts
  has_many :transactions
end
