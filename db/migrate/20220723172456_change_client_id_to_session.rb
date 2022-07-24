# frozen_string_literal: true

class ChangeClientIdToSession < ActiveRecord::Migration[7.0]
  def change
    change_column :sessions, :client_id, :integer, null: true
  end
end
