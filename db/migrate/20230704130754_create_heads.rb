class CreateHeads < ActiveRecord::Migration[7.0]
  def change
    create_table :heads do |t|
      t.string :cedula
      t.string :name
      t.string :sur_name
      t.date :birthdate
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
