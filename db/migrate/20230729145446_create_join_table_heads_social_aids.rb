class CreateJoinTableHeadsSocialAids < ActiveRecord::Migration[7.0]
  def change
    create_join_table :heads, :social_aids do |t|
       t.index [:head_id, :social_aid_id]
       t.index [:social_aid_id, :head_id]
    end
  end
end
