class CreateBranches < ActiveRecord::Migration
  def change
    create_table :branches do |t|
      t.string :name
      t.string :url
      t.string :subject1
      t.string :subject2
      t.string :subject3
      t.string :subject4
      t.string :subject5
      t.string :subject6
      t.string :subject7
      t.string :subject8
      t.string :subject9
      t.string :subject10
      t.string :subject11
      t.string :subject12
      t.string :subject13
      t.string :subject14
      t.string :subject15
      t.string :subject16
      t.string :subject17
      t.string :subject18
      t.string :subject19
      t.string :subject20
      t.references :school, index: true

      t.timestamps
    end
  end
end
