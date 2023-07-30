class AddMemberDisabilityTypesToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :member_disability_types, :string
  end
end
