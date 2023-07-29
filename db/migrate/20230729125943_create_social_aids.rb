class CreateSocialAids < ActiveRecord::Migration[6.1]
  def change
    create_table :social_aids do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

