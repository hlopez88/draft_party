class Pick < ActiveRecord::Base
  belongs_to :team
  has_one :player
  validates :team_id, presence: true
  validates :pick_id, presence: true
end
