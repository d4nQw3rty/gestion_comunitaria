class AddHomeNumberToHeads < ActiveRecord::Migration[7.0]
  def change
    add_column :heads, :home_number, :string
  end
end
