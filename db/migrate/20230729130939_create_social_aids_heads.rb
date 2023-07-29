class CreateSocialAidsHeads < ActiveRecord::Migration[7.0]
  def change
    create_table :social_aids_heads do |t|
      t.references :social_aid, foreign_key: true
      t.references :head, foreign_key: true

      t.timestamps
    end
  end
end
