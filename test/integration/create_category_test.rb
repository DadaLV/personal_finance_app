require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  setup do
    @user1 = User.create(username: "johndoe", email: "johndoe@example.com", password: "password")
    sign_in_as(@user1)
  end

  test "get new category form and create category" do
    get "/categories/new"
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_path, params: { category: { name: "Sports", description: "Sports" } }
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Sports", response.body
  end

  test "get new category form and reject invalid category submission" do
    get "/categories/new"
    assert_response :success
    assert_no_difference 'Category.count' do
      post categories_path, params: { category: { name: " ", description: " " } }
    end
    assert_match "error", response.body
    assert_select 'div.alerts'
    assert_select 'h2.alerts-heading'
    end
end

