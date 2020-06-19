require 'rails_helper'

RSpec.describe "利用者管理", type: :system do
  let(:user_a) { create(:user, name: '利用者A', email: 'a@example.com', password: 'password') }

  describe 'ログイン機能' do
    context 'パスワードがあっている場合' do
      before do
        login_as user_a
      end

      it 'ログインできる' do
        expect(page).to have_content 'ログインしました'
      end
    end


    context 'パスワードが違っている場合' do
      before do
        visit login_path
        fill_in '電子メール', with: user_a.email
        fill_in 'パスワード', with: 'wrong password'
        click_button 'ログイン'
      end

      it 'ログインできない' do
        expect(page).to have_content '電子メールまたはパスワードが違います'
      end
    end
  end
end
