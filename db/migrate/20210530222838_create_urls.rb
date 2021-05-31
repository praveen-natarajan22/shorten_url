class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :url
      t.string :shorturl
      t.integer :clicked, default: 0
      t.string :country
      t.string :ipaddress
      t.timestamps null: false    end
  end
end
