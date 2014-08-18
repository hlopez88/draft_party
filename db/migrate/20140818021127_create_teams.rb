class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :owner
      t.string :name
      t.integer :pick

      t.timestamps
    end
  end
end
