class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :event_location
      t.string :event_description
      t.string :event_site

      t.timestamps null: false
    end
  end
end
