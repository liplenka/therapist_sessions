# frozen_string_literal: true

class Session < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :therapist
end
