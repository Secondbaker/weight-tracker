require "application_system_test_case"

class MeasurementDataTest < ApplicationSystemTestCase
  setup do
    @measurement_datum = measurement_data(:one)
  end

  test "visiting the index" do
    visit measurement_data_url
    assert_selector "h1", text: "Measurement Data"
  end

  test "creating a Measurement datum" do
    visit measurement_data_url
    click_on "New Measurement Datum"

    fill_in "Graph time", with: @measurement_datum.graph_time
    fill_in "Value", with: @measurement_datum.value
    click_on "Create Measurement datum"

    assert_text "Measurement datum was successfully created"
    click_on "Back"
  end

  test "updating a Measurement datum" do
    visit measurement_data_url
    click_on "Edit", match: :first

    fill_in "Graph time", with: @measurement_datum.graph_time
    fill_in "Value", with: @measurement_datum.value
    click_on "Update Measurement datum"

    assert_text "Measurement datum was successfully updated"
    click_on "Back"
  end

  test "destroying a Measurement datum" do
    visit measurement_data_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Measurement datum was successfully destroyed"
  end
end
