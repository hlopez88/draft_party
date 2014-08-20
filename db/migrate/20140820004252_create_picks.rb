class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
      t.integer :team_id
      t.integer :pick_id

      t.timestamps
    end
  end
end
