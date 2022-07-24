# frozen_string_literal: true

class Therapist < ApplicationRecord
  has_many :sessions
  has_many :clients, through: :sessions
end
