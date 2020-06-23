require 'test_helper'

class TaskMailerTest < ActionMailer::TestCase
  test "the truth" do
    assert true
  end

  test "create_email" do
    # タスクを一件生成
    task = Task.new(name: '新しいタスク', description: '詳しい説明です')
    # アサーションのために、メールを作成して保存
    email = TaskMailer.create_email(task)

    # メールを送信後、キューに保存されるかテスト
    assert_emails 1 do
      email.deliver_now
    end

    # 送信されたメールの本文をテスト
    assert_equal ['taskleaf@example.com'], email.from
    assert_equal ['user@example.com'], email.to
    assert_equal 'タスク作成完了メール', email.subject

    # テキスト形式のメール 改行コードを削除してから比較
    assert_equal read_fixture('create_text_email').map(&:strip).join, email.text_part.body.to_s.gsub(/\s/, '')

    # HTML形式のメール
    assert_equal read_fixture('create_html_email').map(&:strip).join, email.html_part.body.to_s.gsub(/\s/, '')
  end
end
