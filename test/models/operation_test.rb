require 'test_helper'

class OperationTest < ActiveSupport::TestCase

  def setup  
    category = Category.create(name: "Food", description: "Food")
    user = User.create(username: "test", email: "test@test.com", password: "123123")
    @operation = Operation.new(amount: 10, odate: "13.02.2023", description: "Coffee", category_id: category.id, user_id: user.id)
  end

  test "operation should be valid" do
    assert @operation.valid?
  end

  test "amount should be present" do
    @operation.amount = " "
    assert_not @operation.valid?
  end

  test "amount should be greater than 0" do
    @operation.amount = -6
    assert_not @operation.valid?
  end

  test "operation date should be present" do
    @operation.odate = " "
    assert_not @operation.valid?
  end

  test "description should be present" do
    @operation.description = " "
    assert_not @operation.valid?
  end

  test "description should not be too short" do
    @operation.description = "dd"
    assert_not @operation.valid?
  end

  test "description should not be too long" do
    @operation.description = "d" * 101
    assert_not @operation.valid?
  end
end