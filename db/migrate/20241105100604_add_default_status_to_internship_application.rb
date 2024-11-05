class AddDefaultStatusToInternshipApplication < ActiveRecord::Migration[7.2]
  def change
    change_column_default :internship_applications, :status, 0
  end
end
