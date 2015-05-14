class AddValidationToTrack < ActiveRecord::Migration
  def change
    change_column :tracks, :category, :string, null: false
  end
end
