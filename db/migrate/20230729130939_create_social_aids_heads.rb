class CreateSocialAidsHeads < ActiveRecord::Migration[7.0]
  def change
    create_table :social_aids_heads do |t|

      t.timestamps
    end
  end
end
