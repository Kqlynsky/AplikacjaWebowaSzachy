json.extract! player, :id, :email, :haslo, :created_at, :updated_at
json.url player_url(player, format: :json)
