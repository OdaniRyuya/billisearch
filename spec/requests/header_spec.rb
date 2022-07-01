require 'rails_helper'

RSpec.describe "header", type: :request do
  describe "ヘッダー" do
    let(:user) { create(:user, :user_image) }

    before do
      sign_in user
      get billisearch_home_path
    end

    it "ロゴと検索窓が表示されていること" do
      expect(response.body).to include "logo-72344c38cf384d2b014049dc27cf6c45ee943f0abdccad0cc9abfcac2471df90.png",
                                      "name=\"q[name_or_address_cont]\"", "name=\"commit\""
    end

    context "ログインしている時" do
      it "ユーザーアイコンとユーザー名が表示されていること" do
        expect(response.body).to include "user_test_name_date", "test.jpg"
      end
    end

    context "ログインしていない時" do
      it "ゲストログイン、ログイン、新規登録ボタンが表示されていること" do
        sign_out user
        get billisearch_home_path
        expect(response.body).to include "header-guest", "header-login", "header-add-account"
      end
    end
  end
end
