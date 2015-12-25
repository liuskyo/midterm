class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :message_id
      t.text :content	
      t.timestamps null: false
    end
        add_index :comments,:user_id
   	    add_index :comments,:message_id
  end
end
