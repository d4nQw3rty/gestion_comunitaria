class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.string :cedula
      t.string :name
      t.string :sur_name
      t.date :birthdate
      t.string :relationship
      t.references :head, null: false, foreign_key: true

      t.timestamps
    end
  end
end
