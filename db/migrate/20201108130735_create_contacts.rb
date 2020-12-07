# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.string :subject
      t.text :message

      t.timestamps
    end
  end
end
