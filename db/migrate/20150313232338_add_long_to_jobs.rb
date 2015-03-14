class AddLongToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :long, :float
  end
end
