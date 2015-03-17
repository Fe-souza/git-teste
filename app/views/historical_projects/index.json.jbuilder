json.array!(@historical_projects) do |historical_project|
  json.extract! historical_project, :id, :id_projeto, :user_id_admin, :tipo, :descricao, :visivel_cliente, :inserido_cliente, :data_criacao
  json.url historical_project_url(historical_project, format: :json)
end
