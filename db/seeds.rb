# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
School.create(:name => 'A大学', :url => 'http://www.yamato-u.ac.jp/', :done_flg => 0)
School.create(:name => 'B大学', :url => 'http://www.u-fukui.ac.jp/', :done_flg => 0)
School.create(:name => 'C大学', :url => 'http://www.gunma-u.ac.jp/', :done_flg => 0)