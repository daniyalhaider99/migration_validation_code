class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :players, :team, :string
    add_column :players, :ratings, :float
  end
end
