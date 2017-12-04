class RenameTypeToJobtype < ActiveRecord::Migration
  def change
    rename_column :posts, :type, :job_type
  end
end
