class AddUserIdToAarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :aarticles, :user_id, :int
  end
end
