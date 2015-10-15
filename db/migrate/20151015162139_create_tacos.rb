class CreateTacos < ActiveRecord::Migration
  def change
    create_table :tacos do |t|
      t.string :name
      t.string :photo
      t.string :description
      t.integer :price_in_cents

      t.timestamps null: false
    end
  end
end
