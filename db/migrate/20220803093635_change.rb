class Change < ActiveRecord::Migration[7.0]
  def up
    add_column :players, :games_played, :integer
  end
  def down
    remove_column :players, :games_played, :integer
  end
end
