class CreateReaders < ActiveRecord::Migration
  def change
    create_table :readers do |t|
    	t.string :email    	
    	t.string :password_digest
    	t.timestamps
    end
    add_index :readers, :email, unique: true
  end
end
