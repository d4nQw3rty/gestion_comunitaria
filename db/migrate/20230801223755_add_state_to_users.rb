class AddStateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :state, null: true, foreign_key: true
  end
end
