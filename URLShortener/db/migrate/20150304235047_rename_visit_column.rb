class RenameVisitColumn < ActiveRecord::Migration
  def change
    rename_column :visits, :submitter_id, :user_id
  end
end
