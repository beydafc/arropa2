class RemoveStatusFromItems < ActiveRecord::Migration[7.1]
  def change
    remove_column :items, :status, :string
  end
end
