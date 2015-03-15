class RenameEventTable < ActiveRecord::Migration
  def change
    rename_table :events, :activities
  end
end
