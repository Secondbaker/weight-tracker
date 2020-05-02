require 'test_helper'

class DataGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_group = data_groups(:one)
  end

  test "should get index" do
    get data_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_data_group_url
    assert_response :success
  end

  test "should create data_group" do
    assert_difference('DataGroup.count') do
      post data_groups_url, params: { data_group: { name: @data_group.name, unit: @data_group.unit } }
    end

    assert_redirected_to data_group_url(DataGroup.last)
  end

  test "should show data_group" do
    get data_group_url(@data_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_group_url(@data_group)
    assert_response :success
  end

  test "should update data_group" do
    patch data_group_url(@data_group), params: { data_group: { name: @data_group.name, unit: @data_group.unit } }
    assert_redirected_to data_group_url(@data_group)
  end

  test "should destroy data_group" do
    assert_difference('DataGroup.count', -1) do
      delete data_group_url(@data_group)
    end

    assert_redirected_to data_groups_url
  end
end
