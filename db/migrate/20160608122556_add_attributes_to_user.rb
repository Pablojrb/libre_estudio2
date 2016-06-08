class AddAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :last_name, :string
    add_column :users, :facebook, :string
    add_column :users, :instagram, :string
  end
end
