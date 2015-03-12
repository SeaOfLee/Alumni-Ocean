class RemoveTypeFromJob < ActiveRecord::Migration
  def change
    remove_column :jobs, :type, :string
  end
end
