require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { cadastro_finalizado: @project.cadastro_finalizado, cod_cliente: @project.cod_cliente, concorrentes: @project.concorrentes, criaador_projeto: @project.criaador_projeto, data_criacao: @project.data_criacao, data_final: @project.data_final, data_inicial: @project.data_inicial, data_prazo: @project.data_prazo, data_projeto_finalizado: @project.data_projeto_finalizado, descricao: @project.descricao, empresa: @project.empresa, endereco_arqs: @project.endereco_arqs, format_outro2: @project.format_outro2, formato2: @project.formato2, formato: @project.formato, formato_outro: @project.formato_outro, id_categoria: @project.id_categoria, id_oramento: @project.id_oramento, id_projeto: @project.id_projeto, id_setor: @project.id_setor, id_sub_categoria: @project.id_sub_categoria, img_proejto: @project.img_proejto, img_projeto_pwn: @project.img_projeto_pwn, inf_obrgatorias: @project.inf_obrgatorias, linguuag: @project.linguuag, objetivo: @project.objetivo, prospeccao: @project.prospeccao, publicar_projeto: @project.publicar_projeto, publico_alvo: @project.publico_alvo, referencia_web: @project.referencia_web, solicitante: @project.solicitante, status: @project.status, titulo: @project.titulo, titulo_projeto: @project.titulo_projeto, valor_projeto: @project.valor_projeto, veiculo: @project.veiculo }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { cadastro_finalizado: @project.cadastro_finalizado, cod_cliente: @project.cod_cliente, concorrentes: @project.concorrentes, criaador_projeto: @project.criaador_projeto, data_criacao: @project.data_criacao, data_final: @project.data_final, data_inicial: @project.data_inicial, data_prazo: @project.data_prazo, data_projeto_finalizado: @project.data_projeto_finalizado, descricao: @project.descricao, empresa: @project.empresa, endereco_arqs: @project.endereco_arqs, format_outro2: @project.format_outro2, formato2: @project.formato2, formato: @project.formato, formato_outro: @project.formato_outro, id_categoria: @project.id_categoria, id_oramento: @project.id_oramento, id_projeto: @project.id_projeto, id_setor: @project.id_setor, id_sub_categoria: @project.id_sub_categoria, img_proejto: @project.img_proejto, img_projeto_pwn: @project.img_projeto_pwn, inf_obrgatorias: @project.inf_obrgatorias, linguuag: @project.linguuag, objetivo: @project.objetivo, prospeccao: @project.prospeccao, publicar_projeto: @project.publicar_projeto, publico_alvo: @project.publico_alvo, referencia_web: @project.referencia_web, solicitante: @project.solicitante, status: @project.status, titulo: @project.titulo, titulo_projeto: @project.titulo_projeto, valor_projeto: @project.valor_projeto, veiculo: @project.veiculo }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
