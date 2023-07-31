class RenameBirthdateColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :heads, :birthdate, :head_birthdate # Cambiar nombre de la columna en la tabla Heads
    rename_column :members, :birthdate, :member_birthdate # Cambiar nombre de la columna en la tabla Members
  end
end
