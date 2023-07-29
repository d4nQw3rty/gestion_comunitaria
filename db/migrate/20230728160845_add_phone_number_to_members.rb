class AddPhoneNumberToMembers < ActiveRecord::Migration[7.0]
  def change
    add_column :members, :phone_number, :string
  end
end
