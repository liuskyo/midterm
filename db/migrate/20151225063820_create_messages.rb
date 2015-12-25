class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
	  t.string :user_id
      t.string :topic
      t.string :category
      t.text :content
      t.timestamps null: false

    end
    add_index :messages,:user_id
  end
end
