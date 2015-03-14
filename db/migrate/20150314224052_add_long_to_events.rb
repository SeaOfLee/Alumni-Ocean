class AddLongToEvents < ActiveRecord::Migration
  def change
    add_column :events, :long, :float
  end
end
