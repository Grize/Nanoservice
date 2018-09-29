# frozen_string_literal: true

class Messanger < ApplicationRecord
  has_and_belongs_to_many :messages
  enum types: {
    Telegram: 'Telegram',
    WhatsApp: 'WhatsApp',
    Viber: 'Viber'
  }

  validates :name,
            presence: true,
            inclusion:
            {
              in: Messanger.types,
              message: "We don't support what messanger"
            }
end
