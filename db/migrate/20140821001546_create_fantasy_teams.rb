class CreateFantasyTeams < ActiveRecord::Migration
  def change
    create_table :fantasy_teams do |t|
      t.string :team_name
      t.integer :draft_position

      t.timestamps
    end
  end
end
