class CreateHeadSocialAids < ActiveRecord::Migration[7.0]
  def change
    create_table :head_social_aids do |t|
      t.references :head, null: false, foreign_key: true
      t.references :social_aid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
