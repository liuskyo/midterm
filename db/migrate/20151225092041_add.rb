class Add < ActiveRecord::Migration
  def change
  	add_column :messages,:category_id,:string
  add_index :messages,:category_id
end
end
