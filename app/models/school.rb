class School < ActiveRecord::Base
  has_many :branches
  accepts_nested_attributes_for :branches
  #オプションを追加することもできる。編集時の削除や、limitなど
end
