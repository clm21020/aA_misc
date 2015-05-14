class CreateCats < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.string :color, null: false
      t.string :name, null: false, index: true
      t.string :sex, null: false

      t.date :birth_date
      t.text :description

      t.timestamps
    end
  end
end
