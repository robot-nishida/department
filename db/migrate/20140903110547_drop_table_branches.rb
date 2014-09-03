class DropTableBranches < ActiveRecord::Migration
  def change
    drop_table :branches
  end
end
