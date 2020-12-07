# frozen_string_literal: true

class Contact < ApplicationRecord
  validates :email, email: true
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
