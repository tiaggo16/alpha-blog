class AddTimestampsToAarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :aarticles, :created_at, :datetime
    add_column :aarticles, :updated_at, :datetime
  end
end
