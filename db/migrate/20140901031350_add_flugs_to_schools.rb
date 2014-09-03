class AddFlugsToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :done_flg, :boolean
  end
end
