class ChangePhoneToString < ActiveRecord::Migration[5.1]
  def up
    change_column :users, :phone, :string
  end
end
