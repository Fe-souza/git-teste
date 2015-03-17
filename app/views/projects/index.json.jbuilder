json.array!(@projects) do |project|
  json.extract! project, :id, :id_projeto, :valor_projeto, :cod_cliente, :id_categoria, :id_sub_categoria, :data_criacao, :data_inicial, :data_final, :titulo, :descricao, :solicitante, :data_prazo, :status, :prospeccao, :endereco_arqs, :data_projeto_finalizado, :criaador_projeto, :veiculo, :formato, :formato_outro, :formato2, :format_outro2, :linguuag, :objetivo, :publico_alvo, :inf_obrgatorias, :concorrentes, :referencia_web, :cadastro_finalizado, :id_setor, :titulo_projeto, :img_proejto, :img_projeto_pwn, :publicar_projeto, :empresa, :id_oramento
  json.url project_url(project, format: :json)
end
