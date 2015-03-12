class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :company
      t.string :location
      t.string :type
      t.string :description
      t.string :contact

      t.timestamps null: false
    end
  end
end
