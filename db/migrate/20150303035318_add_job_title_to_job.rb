class AddJobTitleToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :job_title, :string
  end
end
