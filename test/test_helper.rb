ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!


class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors)
  parallelize(workers: 1)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

# https://y-yagi.tumblr.com/post/165708828990/rubyのwarningから不要なwarningを除外する
module Warning
  def warn(str)
    return if str.match?("gems")

    super
  end
end
$VERBOSE = true

# module LoginHelper
#   def login_as(user)
#     post login_url(email: user.email, password: 'pass')
#   end
# end
#
# class ActionDispatch::IntegrationTest
#   include LoginHelper
# end
