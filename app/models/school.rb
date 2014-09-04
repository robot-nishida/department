require 'csv'
class School < ActiveRecord::Base
  has_many :branches
  accepts_nested_attributes_for :branches
  #オプションを追加することもできる。編集時の削除や、limitなど

  def self.to_csv
    headers = %w(ID 学校名 学校URL 学部名 学部URL 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 学科 更新日時 作成日時)
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      all.each do |row|
        csv << row.attributes.values_at(*self.column_names)
        #csv << [school.name, 'name']
      end
    end
    csv_data.encode(Encoding::SJIS)
  end
end
