json.array!(@drafted_players) do |drafted_player|
  json.extract! drafted_player, :id, :player_id, :team_id, :draft_no
  json.url drafted_player_url(drafted_player, format: :json)
end
