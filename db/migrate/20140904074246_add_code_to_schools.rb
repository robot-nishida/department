class AddCodeToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :sc_code, :string
    add_column :schools, :k_code, :string
  end
end
