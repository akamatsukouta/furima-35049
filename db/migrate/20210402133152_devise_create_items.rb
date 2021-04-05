# frozen_string_literal: true

class DeviseCreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                    null: false
      t.integer :price,                  null: false
      t.text :explanation,               null: false
      t.integer :product_status_id,      null: false
      t.integer :shipping_charge_id,     null: false
      t.integer :prefecture_id,          null: false
      t.integer :days_to_ship_id,        null: false
      t.integer :category_id,            null: false
      t.integer :user_id,                null: false, foreign_key: true

      t.timestamps null: false
    end
  end
end
