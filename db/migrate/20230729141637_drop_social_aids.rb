class DropSocialAids < ActiveRecord::Migration[7.0]
  def change
    drop_table :social_aids, force: :cascade
  end
end
