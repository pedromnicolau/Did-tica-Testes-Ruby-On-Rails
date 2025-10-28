class CreateVisits < ActiveRecord::Migration[8.0]
  def change
    create_table :visits do |t|
      t.references :property, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true
      t.datetime :scheduled_at
      t.integer :status

      t.timestamps
    end
  end
end
