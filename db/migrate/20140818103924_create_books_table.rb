class CreateBooksTable < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.references :reader, index: true
    	t.string :title
    	t.timestamps
    end
  end
end
