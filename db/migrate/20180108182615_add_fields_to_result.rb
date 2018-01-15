class AddFieldsToResult < ActiveRecord::Migration[5.1]
  def up
    add_column :results, :user_id, :integer
    add_column :results, :survey_id, :integer
    add_column :results, :answers, :string, array: true, default: []
    add_column :results, :match_id, :integer, default: nil
  end
end
