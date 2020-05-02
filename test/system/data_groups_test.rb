require "application_system_test_case"

class DataGroupsTest < ApplicationSystemTestCase
  setup do
    @data_group = data_groups(:one)
  end

  test "visiting the index" do
    visit data_groups_url
    assert_selector "h1", text: "Data Groups"
  end

  test "creating a Data group" do
    visit data_groups_url
    click_on "New Data Group"

    fill_in "Name", with: @data_group.name
    fill_in "Unit", with: @data_group.unit
    click_on "Create Data group"

    assert_text "Data group was successfully created"
    click_on "Back"
  end

  test "updating a Data group" do
    visit data_groups_url
    click_on "Edit", match: :first

    fill_in "Name", with: @data_group.name
    fill_in "Unit", with: @data_group.unit
    click_on "Update Data group"

    assert_text "Data group was successfully updated"
    click_on "Back"
  end

  test "destroying a Data group" do
    visit data_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Data group was successfully destroyed"
  end
end
