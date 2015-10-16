class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.column :title, :string
      t.column :author, :string, :default =>"Anonymous"
      
      t.timestamps
    end
  end
end
