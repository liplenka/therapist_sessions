# frozen_string_literal: true

class CreateTherapists < ActiveRecord::Migration[7.0]
  def change
    create_table :therapists do |t|
      t.string :name

      t.timestamps
    end
  end
end
