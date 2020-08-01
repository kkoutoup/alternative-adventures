class ChangeTypeToExperienceType < ActiveRecord::Migration[6.0]
  def change
    rename_column :experiences, :type, :experience_type
  end
end
