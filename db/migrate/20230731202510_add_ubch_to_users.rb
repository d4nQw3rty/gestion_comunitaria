class AddUbchToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :ubch, :string
  end
end
