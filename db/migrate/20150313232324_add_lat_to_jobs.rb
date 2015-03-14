class AddLatToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :lat, :float
  end
end
