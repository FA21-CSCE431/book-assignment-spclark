class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.decimal :price, null: false
      t.date :'published-date', null: false

      t.timestamps
    end
  end
end
