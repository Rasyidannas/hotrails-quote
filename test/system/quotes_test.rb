require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first # Reference to the first fixture quote
  end

  test "Showing a quote" do
    visit quotes_path
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Creating a new quote" do
    # When we visit the Quotes#index page
    # we excpect to see a title with "Quotes" 
    visit quotes_path
    assert_selector "h1", text: "Quotes"

    # When we click on the link with the text "New Qoute"
    # When we fill in the name input with "Capybara quote"
    click_on "New quote"
    fill_in "Name", with: "Capybara quote"

    # and we click on "Create Quote"
    # we expect to land on a page with the title "New quote"
    assert_selector "h1", text: "New quote"
    click_on "Create quote"

    # We expect to be back on the page with the title "Quotes"
    # and to se our "Capybara quote" added to the list
    assert_selector "h1", text: "Quotes"
    assert_text "Capybara quote"
  end

  test "Updating a quote" do
    visit quotes_path
    assert_selector "h1", text: "Quotes"
  
    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"

    assert_selector "h1", text: "Quotes"
    click_on "Update quote"

    assert_selector "h1", text: "Quotes"
    assert_text "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    assert_text @quote.name

    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
