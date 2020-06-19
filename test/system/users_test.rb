require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:taro)
  end


  test "パスワードが正しいと、ログインできる" do
    login_as(@user)

    assert_selector ".ui.success.message", text: "ログインしました。"
  end

  test "パスワードが違うと、ログインできない" do
    digest = BCrypt::Password.create('wrong password', cost: BCrypt::Engine::MIN_COST)
    @user.update_columns(password_digest: digest)
    # visit login_url
    # fill_in '電子メール', with: @user.email
    # fill_in 'パスワード', with: 'wrong password'
    # click_on 'ログインする'
    login_as(@user)

    assert_selector ".ui.warning.message", text: "電子メールまたはパスワードが違います"
  end
end
