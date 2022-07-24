# frozen_string_literal: true

class User < ApplicationRecord
  has_many :messages, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
