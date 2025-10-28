class CreateDeals < ActiveRecord::Migration[8.0]
  def change
    create_table :deals do |t|
      t.references :property, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true
      t.integer :price_cents
      t.datetime :signed_at

      t.timestamps
    end
  end
end
