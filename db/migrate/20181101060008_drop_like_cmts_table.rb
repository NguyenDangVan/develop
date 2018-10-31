class DropLikeCmtsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :like_cmts
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
