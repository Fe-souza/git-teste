json.array!(@images_projects) do |images_project|
  json.extract! images_project, :id, :id_projeto, :img, :tipo
  json.url images_project_url(images_project, format: :json)
end
