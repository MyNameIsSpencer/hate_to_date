class ChangeUserColumnFsa < ActiveRecord::Migration[5.1]
  def up
    rename_column :users, :FSA, :fsa
  end
end
