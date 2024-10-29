class CreateInternships < ActiveRecord::Migration[7.2]
  def change
    create_table :internships do |t|
      t.string :title
      t.string :role
      t.text :description
      t.string :location
      t.date :start_date
      t.date :end_date
      t.integer :compensation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
