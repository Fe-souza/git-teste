require 'test_helper'

class ContatosClientesControllerTest < ActionController::TestCase
  setup do
    @contatos_cliente = contatos_clientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contatos_clientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contatos_cliente" do
    assert_difference('ContatosCliente.count') do
      post :create, contatos_cliente: { cargo_contato: @contatos_cliente.cargo_contato, cod_cliente: @contatos_cliente.cod_cliente, data_criacao: @contatos_cliente.data_criacao, ddd_tel_1: @contatos_cliente.ddd_tel_1, ddd_tel_2: @contatos_cliente.ddd_tel_2, ddd_tel_3: @contatos_cliente.ddd_tel_3, email_contato: @contatos_cliente.email_contato, last_update: @contatos_cliente.last_update, nome_contato: @contatos_cliente.nome_contato, senha: @contatos_cliente.senha, status: @contatos_cliente.status, tel_1: @contatos_cliente.tel_1, tel_2: @contatos_cliente.tel_2, tel_3: @contatos_cliente.tel_3 }
    end

    assert_redirected_to contatos_cliente_path(assigns(:contatos_cliente))
  end

  test "should show contatos_cliente" do
    get :show, id: @contatos_cliente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contatos_cliente
    assert_response :success
  end

  test "should update contatos_cliente" do
    patch :update, id: @contatos_cliente, contatos_cliente: { cargo_contato: @contatos_cliente.cargo_contato, cod_cliente: @contatos_cliente.cod_cliente, data_criacao: @contatos_cliente.data_criacao, ddd_tel_1: @contatos_cliente.ddd_tel_1, ddd_tel_2: @contatos_cliente.ddd_tel_2, ddd_tel_3: @contatos_cliente.ddd_tel_3, email_contato: @contatos_cliente.email_contato, last_update: @contatos_cliente.last_update, nome_contato: @contatos_cliente.nome_contato, senha: @contatos_cliente.senha, status: @contatos_cliente.status, tel_1: @contatos_cliente.tel_1, tel_2: @contatos_cliente.tel_2, tel_3: @contatos_cliente.tel_3 }
    assert_redirected_to contatos_cliente_path(assigns(:contatos_cliente))
  end

  test "should destroy contatos_cliente" do
    assert_difference('ContatosCliente.count', -1) do
      delete :destroy, id: @contatos_cliente
    end

    assert_redirected_to contatos_clientes_path
  end
end
