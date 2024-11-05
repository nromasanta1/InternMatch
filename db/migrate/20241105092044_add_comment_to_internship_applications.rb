class AddCommentToInternshipApplications < ActiveRecord::Migration[7.2]
  def change
    add_column :internship_applications, :comment, :text
  end
end
