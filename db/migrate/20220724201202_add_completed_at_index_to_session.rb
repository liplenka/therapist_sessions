# frozen_string_literal: true

class AddCompletedAtIndexToSession < ActiveRecord::Migration[7.0]

  def change
    add_index :sessions, :completed_at
  end
end
