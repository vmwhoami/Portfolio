# frozen_string_literal: true

class CreateRecentworks < ActiveRecord::Migration[6.0]
  def change
    create_table :recentworks do |t|
      t.string :title
      t.string :subtitle
      t.text :body
      t.text :main_image
      t.text :thumb_image

      t.timestamps
    end
  end
end
