class AddSocialAidRefToHead < ActiveRecord::Migration[7.0]
  def change
    add_reference :heads, :social_aid, null: true, foreign_key: true
  end
end
