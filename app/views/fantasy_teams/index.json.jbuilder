json.array!(@fantasy_teams) do |fantasy_team|
  json.extract! fantasy_team, :id, :team_name, :draft_position
  json.url fantasy_team_url(fantasy_team, format: :json)
end
