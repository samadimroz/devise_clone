class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_id
      t.string :password
      t.integer :mobile
      t.string :dob

      t.timestamps
    end
  end
end
