class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :user_type
      t.string :first_name
      t.string :last_name
      t.string :industry
      t.string :email
      t.string :contact_number
      t.string :location
      t.string :profile_picture

      t.timestamps
    end
  end
end
