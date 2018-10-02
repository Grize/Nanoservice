# frozen_string_literal: true

class Message < ApplicationRecord
  has_and_belongs_to_many :messangers
  belongs_to :user, optional: true
  INVALID_DATA = /[{}=!?()]+/
  validates :sender,
            presence: true,
            length:
            {
              minimum: 3,
              maximum: 50
            },
            format: { without: INVALID_DATA }
  validates :addressee,
            presence: true,
            length:
            {
              minimum: 3,
              maximum: 100
            },
            format: { without: INVALID_DATA }
  validates :body,
            presence: true,
            length:
            {
              minimum: 3,
              maximum: 300
            },
            format: { without: INVALID_DATA }
end
