class AddPhoneNumberToHeads < ActiveRecord::Migration[7.0]
  def change
    add_column :heads, :phone_number, :string
  end
end
