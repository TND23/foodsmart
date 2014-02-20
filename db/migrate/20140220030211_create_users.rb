class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
        # t.has_many :endorsements
        # t.has_many :recipes
    	t.string :username, :null => false
    	t.string :password_digest, :null => false
    	t.string :session_token
    	t.string :cook_book, :null => false
    	t.timestamps
    end
    add_index :users, :username, :unique => true
    add_index :users, :session_token, :unique => true
  end
end
