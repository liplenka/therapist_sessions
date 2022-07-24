# frozen_string_literal: true

class CreateSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sessions do |t|
      t.references :client, null: false
      t.references :therapist, null: false
      t.datetime :start_at, null: false
      t.datetime :completed_at

      t.timestamps
    end
  end
end
