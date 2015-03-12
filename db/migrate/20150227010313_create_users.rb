class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :is_admin
      t.string :postal_code
      t.string :country
      t.string :program_attended
      t.string :campus
      t.string :cohort
      t.string :bio

      t.timestamps null: false
    end
  end
end
