class AddUserIdToColors < ActiveRecord::Migration
  def change
    add_column :colors, :user_id, :integer
  end
end
