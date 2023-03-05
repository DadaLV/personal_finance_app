require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports", description: "Sports")
    @user1 = User.create(username: "johndoe", email: "johndoe@example.com", password: "password")
    sign_in_as(@user1)
  end

  test "should get index" do
    sign_in_as(@user1)
    get categories_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user1)
    get new_category_url
    assert_response :success
  end

  test "should create category" do
    sign_in_as(@user1)
    assert_difference("Category.count", 1) do
      post categories_url, params: { category: { name: "Vacation", description: "Vacation" } }
    end
  end

  #   assert_redirected_to category_url(Category.last)
  # end

  # test "should show category" do
  #   sign_in_as(@user1)
  #   get category_url(@category)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_category_url(@category)
  #   assert_response :success
  # end

  # test "should update category" do
  #   patch category_url(@category), params: { category: {  } }
  #   assert_redirected_to category_url(@category)
  # end

  # test "should destroy category" do
  #   assert_difference("Category.count", -1) do
  #     delete category_url(@category)
  #   end

  #   assert_redirected_to categories_url
  # end
end
