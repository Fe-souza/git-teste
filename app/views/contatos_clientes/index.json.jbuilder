json.array!(@contatos_clientes) do |contatos_cliente|
  json.extract! contatos_cliente, :id, :cod_cliente, :ddd_tel_1, :tel_1, :ddd_tel_2, :tel_2, :ddd_tel_3, :tel_3, :nome_contato, :cargo_contato, :email_contato, :senha, :data_criacao, :status, :last_update
  json.url contatos_cliente_url(contatos_cliente, format: :json)
end
