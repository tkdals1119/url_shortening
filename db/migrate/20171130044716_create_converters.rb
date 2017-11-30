class CreateConverters < ActiveRecord::Migration
  def change
    create_table :converters do |t|
      
      t.string :originurl
      t.string :shorturl

      t.timestamps null: false
    end
  end
end
