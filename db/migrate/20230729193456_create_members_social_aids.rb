class CreateMembersSocialAids < ActiveRecord::Migration[6.1]
  def change
    create_table :members_social_aids do |t|
      t.belongs_to :member
      t.belongs_to :social_aid
      # puedes agregar otros campos si los necesitas
      t.timestamps
    end
  end
end
