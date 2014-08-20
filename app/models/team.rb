class Team < ActiveRecord::Base
  has_many :picks
  has_many :players, through: :picks
  
  def pick!(player)
    picks.create!(team_id: self.id, player_id: player.id)
  end
end
