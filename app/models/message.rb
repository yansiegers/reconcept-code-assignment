# frozen_string_literal: true

class Message < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags
end
