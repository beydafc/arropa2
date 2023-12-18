class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.float :price
      t.string :size
      t.string :genre
      t.string :color
      t.string :status
      t.string :type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
