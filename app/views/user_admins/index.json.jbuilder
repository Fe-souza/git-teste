json.array!(@user_admins) do |user_admin|
  json.extract! user_admin, :id, :user_id_admin, :nome_usuario, :email_usuario, :ddd_usuario, :fone_usuario, :chave_admin, :perfil_usuario, :status
  json.url user_admin_url(user_admin, format: :json)
end
