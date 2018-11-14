class RemoveParentIdFromComment < ActiveRecord::Migration[5.2]
  def change
    remove_column :comments, :parents_id, :integer
  end
end
