class Transaction < ApplicationRecord
  belongs_to :transaction_type
  belongs_to :payment
end
