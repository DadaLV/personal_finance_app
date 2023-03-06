require "test_helper"

class OperationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @operation = Operation.create(amount: 25, odate: "Wed, 25 Jan 2023 00:00:00.000000000 UTC +00:00", description: "Pancake", category_id: 1, user_id: 1)
    @user1 = User.create(username: "johndoe", email: "johndoe@example.com", password: "password")
    @category = Category.create(name: "Sports", description: "Sports")
    sign_in_as(@user1)
  end

  test "should get index" do
    sign_in_as(@user1)
    get @user1_url
    assert_response :success
  end

  test "should get new" do
    sign_in_as(@user1)
    get new_operation_url
    assert_response :success
  end

  # test "should create operation" do
  #   sign_in_as(@user1)
  #   assert_difference -> { Operation.count }, 1 do
  #     post operations_url, params: { operation: { amount: 25.00, odate: "25.01.2023", description: "cake", category_id: 1 } }
  #   end

  #   assert_redirected_to operation_path(Operation.last)
  # end

  # test "should show operation" do
  #   sign_in_as(@user1)
  #   get operation_url(@operation)
  #   assert_response :success
  # end

  # test "should get edit" do
  #   get edit_operation_url(@operation)
  #   assert_response :success
  # end

  # test "should update operation" do
  #   patch operation_url(@operation), params: { operation: {  } }
  #   assert_redirected_to operation_url(@operation)
  # end

  # test "should destroy operation" do
  #   assert_difference("Operation.count", -1) do
  #     delete operation_url(@operation)
  #   end

  #   assert_redirected_to operations_url
  # end
end
