require 'test_helper'

class HistoricalProjectsControllerTest < ActionController::TestCase
  setup do
    @historical_project = historical_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:historical_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create historical_project" do
    assert_difference('HistoricalProject.count') do
      post :create, historical_project: { data_criacao: @historical_project.data_criacao, descricao: @historical_project.descricao, id_projeto: @historical_project.id_projeto, inserido_cliente: @historical_project.inserido_cliente, tipo: @historical_project.tipo, user_id_admin: @historical_project.user_id_admin, visivel_cliente: @historical_project.visivel_cliente }
    end

    assert_redirected_to historical_project_path(assigns(:historical_project))
  end

  test "should show historical_project" do
    get :show, id: @historical_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @historical_project
    assert_response :success
  end

  test "should update historical_project" do
    patch :update, id: @historical_project, historical_project: { data_criacao: @historical_project.data_criacao, descricao: @historical_project.descricao, id_projeto: @historical_project.id_projeto, inserido_cliente: @historical_project.inserido_cliente, tipo: @historical_project.tipo, user_id_admin: @historical_project.user_id_admin, visivel_cliente: @historical_project.visivel_cliente }
    assert_redirected_to historical_project_path(assigns(:historical_project))
  end

  test "should destroy historical_project" do
    assert_difference('HistoricalProject.count', -1) do
      delete :destroy, id: @historical_project
    end

    assert_redirected_to historical_projects_path
  end
end
