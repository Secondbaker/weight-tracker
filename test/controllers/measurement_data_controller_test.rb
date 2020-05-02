require 'test_helper'

class MeasurementDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @measurement_datum = measurement_data(:one)
  end

  test "should get index" do
    get measurement_data_url
    assert_response :success
  end

  test "should get new" do
    get new_measurement_datum_url
    assert_response :success
  end

  test "should create measurement_datum" do
    assert_difference('MeasurementDatum.count') do
      post measurement_data_url, params: { measurement_datum: { graph_time: @measurement_datum.graph_time, value: @measurement_datum.value } }
    end

    assert_redirected_to measurement_datum_url(MeasurementDatum.last)
  end

  test "should show measurement_datum" do
    get measurement_datum_url(@measurement_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_measurement_datum_url(@measurement_datum)
    assert_response :success
  end

  test "should update measurement_datum" do
    patch measurement_datum_url(@measurement_datum), params: { measurement_datum: { graph_time: @measurement_datum.graph_time, value: @measurement_datum.value } }
    assert_redirected_to measurement_datum_url(@measurement_datum)
  end

  test "should destroy measurement_datum" do
    assert_difference('MeasurementDatum.count', -1) do
      delete measurement_datum_url(@measurement_datum)
    end

    assert_redirected_to measurement_data_url
  end
end
