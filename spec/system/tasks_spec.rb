require 'rails_helper'

RSpec.describe 'タスク管理機能', type: :system do
  # 利用者A, Bの作成
  # let は遅延評価。必要に応じ作られる。
  let(:user_a) { create(:user, name: '利用者A', email: 'a@example.com') }
  let(:user_b) { create(:user, name: '利用者B', email: 'b@example.com') }
  # let! は即時評価 必ず作られる。
  let!(:task_a) { create(:task, name: '利用者Aのタスク', user: user_a) }

  shared_examples_for '利用者Aが作成したタスクが表示される' do
    it { expect(page).to have_content '利用者Aのタスク' }
  end

  describe '一覧表示機能' do
    context '利用者Aがログインしているとき' do
      before do
        login_as user_a
      end
      # it '利用者Aが作成したタスクが表示される' do
      #   expect(page).to have_content '利用者Aのタスク'
      # end
      it_behaves_like '利用者Aが作成したタスクが表示される'
    end

    context '利用者Bがログインしているとき' do
      before do
        login_as user_b
      end
      it '利用者Aが表示されたタスクが表示されない' do
        expect(page).to have_no_content '利用者Aのタスク'
      end
    end
  end

  describe '詳細表示機能' do
    context '利用者Aがログインしているとき' do
      before do
        login_as user_a
        visit task_path(task_a)
      end

      # it '利用者Aが作成したタスクが表示される' do
      #   expect(page).to have_content '利用者Aのタスク'
      # end
      it_behaves_like '利用者Aが作成したタスクが表示される'
    end
  end

  describe '新規作成機能' do
    before do
      login_as user_a
      visit new_task_path
      fill_in '名称', with: task_name
      click_button '登録する'
    end

    context '新規作成画面で名称を入力したとき' do
      let(:task_name) { '新しいタスク' }

      it '正常に登録される' do
        expect(page).to have_selector '.ui.success.message', text: '新しいタスク'
      end
    end

    context '新規作成画面で名称を入力しなかったとき' do
      let(:task_name) { '' }

      it 'エラーとなる' do
        within '#error_explanation' do
          expect(page).to have_content '名称を入力してください'
        end
      end
    end
  end
end
