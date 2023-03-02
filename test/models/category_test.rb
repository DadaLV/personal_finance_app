require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  
  def setup  
    @category = Category.new(name: "Food", description: "Food in shops")
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "Food", description: "Food in shops")
    assert_not @category2.valid?
  end

  test "description should be present" do
    @category.description = " "
    assert_not @category.valid?
  end
end