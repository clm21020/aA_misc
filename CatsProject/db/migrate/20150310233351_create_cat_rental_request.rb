class CreateCatRentalRequest < ActiveRecord::Migration
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, index: true, null: false
      t.datetime :start_date, null: false
      t.datetime :end_date, null: false
      t.string :status, default: "PENDING"

      t.timestamps
    end
  end
end
