class AddKindToItems < ActiveRecord::Migration[7.1]
  def change
    add_column :items, :kind, :string
  end
end
