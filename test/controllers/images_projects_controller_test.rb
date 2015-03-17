require 'test_helper'

class ImagesProjectsControllerTest < ActionController::TestCase
  setup do
    @images_project = images_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create images_project" do
    assert_difference('ImagesProject.count') do
      post :create, images_project: { id_projeto: @images_project.id_projeto, img: @images_project.img, tipo: @images_project.tipo }
    end

    assert_redirected_to images_project_path(assigns(:images_project))
  end

  test "should show images_project" do
    get :show, id: @images_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @images_project
    assert_response :success
  end

  test "should update images_project" do
    patch :update, id: @images_project, images_project: { id_projeto: @images_project.id_projeto, img: @images_project.img, tipo: @images_project.tipo }
    assert_redirected_to images_project_path(assigns(:images_project))
  end

  test "should destroy images_project" do
    assert_difference('ImagesProject.count', -1) do
      delete :destroy, id: @images_project
    end

    assert_redirected_to images_projects_path
  end
end
