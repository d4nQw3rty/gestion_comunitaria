class AddDiscapacidadToHeads < ActiveRecord::Migration[7.0]
  def change
    add_column :heads, :disability, :boolean
  end
end
