class CreateProperties < ActiveRecord::Migration[8.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.integer :price_cents
      t.integer :status
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
