class AddPasswordFieldToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :password, :digest
  end
end
