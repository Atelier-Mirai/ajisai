require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  setup do
    @article = articles(:poraano)
  end

  test "visiting the index" do
    visit articles_url
    assert_selector "h1", text: "articles"
  end

  test "creating a Article" do
    visit articles_url
    click_on "New Article"

    click_on "登録する"

    assert_text "Article was successfully created"
    click_on "Back"
  end

  test "updating a Article" do
    visit articles_url
    click_on "Edit", match: :first

    click_on "更新する"

    assert_text "Article was successfully updated"
    click_on "Back"
  end

  test "destroying a Article" do
    visit articles_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Article was successfully destroyed"
  end
end
