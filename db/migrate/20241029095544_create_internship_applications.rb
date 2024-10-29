class CreateInternshipApplications < ActiveRecord::Migration[7.2]
  def change
    create_table :internship_applications do |t|
      t.date :application_date
      t.integer :status
      t.references :internship, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
