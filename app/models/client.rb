# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :sessions

  scope :clients_with_next_session_by_therapist, ->(therapist_id) do
    joins(:sessions)
    .where('sessions.completed_at IS NULL AND sessions.therapist_id IS ?', therapist_id)
    .select('clients.id, clients.name, clients.surname, MIN(sessions.start_at) as start_at')
    .group('clients.id')
    .order('start_at')
  end

  # def next_session
  #   # get next session
  # end
end
