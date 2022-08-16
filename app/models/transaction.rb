# frozen_string_literal: true

class Transaction < ApplicationRecord
  validates :pokemon_name, presence: true
  validates :transaction_value, presence: true
  enum transaction_type: %i[compra venda]

end
