class Discount < ApplicationRecord
  belongs_to :discount_type
  belongs_to :payment
end
