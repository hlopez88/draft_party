class CreateDraftedPlayers < ActiveRecord::Migration
  def change
    create_table :drafted_players do |t|
      t.integer :player_id
      t.integer :team_id
      t.integer :draft_no

      t.timestamps
    end
  end
end
