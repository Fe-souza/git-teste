json.array!(@categories) do |category|
  json.extract! category, :id, :nome_categoria, :data_criacao
  json.url category_url(category, format: :json)
end
