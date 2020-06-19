require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "task_a 名称" do
    assert_equal tasks(:task_a).name, 'task_a'
  end

  test "task_a 所有者" do
    assert_equal tasks(:task_a).user, users(:user_a)
  end
end
