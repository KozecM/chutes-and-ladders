class CreatesGame < ActiveRecord::Migration[5.2]
  def change
    remove_columns :games, :player_one_name, :player_two_name
    drop_table :spaces
  end
end
