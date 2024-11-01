class AddFieldToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :user_type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :industry, :string
    add_column :users, :contact_number, :string
    add_column :users, :location, :string
    add_column :users, :profile_picture, :string
  end
end
