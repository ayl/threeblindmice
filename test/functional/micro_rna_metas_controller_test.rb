require 'test_helper'

class MicroRnaMetasControllerTest < ActionController::TestCase
  setup do
    @micro_rna_meta = micro_rna_metas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:micro_rna_metas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create micro_rna_meta" do
    assert_difference('MicroRnaMeta.count') do
      post :create, :micro_rna_meta => @micro_rna_meta.attributes
    end

    assert_redirected_to micro_rna_meta_path(assigns(:micro_rna_meta))
  end

  test "should show micro_rna_meta" do
    get :show, :id => @micro_rna_meta.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @micro_rna_meta.to_param
    assert_response :success
  end

  test "should update micro_rna_meta" do
    put :update, :id => @micro_rna_meta.to_param, :micro_rna_meta => @micro_rna_meta.attributes
    assert_redirected_to micro_rna_meta_path(assigns(:micro_rna_meta))
  end

  test "should destroy micro_rna_meta" do
    assert_difference('MicroRnaMeta.count', -1) do
      delete :destroy, :id => @micro_rna_meta.to_param
    end

    assert_redirected_to micro_rna_metas_path
  end
end
