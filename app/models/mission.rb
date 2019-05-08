class Mission < ApplicationRecord
  belongs_to :listing

  # Different prices by type of mission
  PRICES = {
    FirstCheckin: 10,
    CheckoutCheckin: 10,
    LastCheckout: 5
  }

  def self.get_price_by_type(type)
    PRICES[type.to_sym]
  end

  # Display the type of mission in underscore
  def mission_type
    type.underscore
  end
end
