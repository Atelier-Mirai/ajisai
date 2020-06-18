module LoginSupport
  # 利用者がログインする
  def login_as(user)
    visit login_path
    # click_link "ログイン"
    fill_in "電子メール", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
end

# RSpecの設定 LoginSupport をinclude
RSpec.configure do |config|
  config.include LoginSupport
end
