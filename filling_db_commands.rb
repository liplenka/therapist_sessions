5.times {|i| t = Therapist.new; t.name = "Therapist_#{i}"; t.save! }
20.times {|i| c = Client.new; t.name = "Client_name_#{i}"; t.surname = "Client_surname_#{i}"; c.save! }
Client.all.each {|c| 10.times {|i| s = Session.new; s.start_at = Time.current + (i+1).weeks; s.therapist = Therapist.all.sample; s.client = c; s.save!}}

# def next_session
#    sessions.where(completed_at: nil).first
# end
#
# class Therapist::ClientsController < TherapistContoller
#   def index
#     @clients = current_therapist.clients
#   end
# end
#
# # lk/clients.html.erb
#
# clients.each do |client|
#   client.name, client.surname
#   client.next_session.start_at
# end

Client.joins(:sessions).where('sessions.completed_at IS NULL').select('clients.id, clients.name, clients.surname, MIN(sessions.start_at)
as start_at').group('clients.id').order('start_at')


@clients = Client.joins(:sessions).where('sessions.completed_at IS NULL AND sessions.therapist_id IS ?', @current_therapist.id).select('clients.id, clients.name, clients.surname, MIN(sessions.start_at) as start_at').group('clients.id').order('start_at')


@clients = clients_with_next_session_by_therapist(@current_therapist.id)

  scope :clients_with_next_session_by_therapist, ->(therapist_id) { joins(:sessions).where('sessions.completed_at IS NULL AND sessions.therapist_id IS ?', therapist_id).select('clients.id, clients.name, clients.surname, MIN(sessions.start_at) as start_at').group('clients.id').order('start_at') }


# test

@clients = Client.clients_with_next_session_by_therapist(12)

@clients.each do |client|
  puts client.name
  puts client.surname
  puts client.start_at
end

# add pagination
