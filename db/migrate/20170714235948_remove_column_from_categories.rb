class RemoveColumnFromCategories < ActiveRecord::Migration[5.1]
  def change
    remove_column :categories, :job_id
  end
end
