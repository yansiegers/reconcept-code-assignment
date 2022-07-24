# frozen_string_literal: true

class Tag < ApplicationRecord
  has_and_belongs_to_many :messages

  def messages_count
    messages.count
  end
end
