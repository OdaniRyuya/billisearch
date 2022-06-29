require 'rails_helper'

RSpec.describe "Mypage", type: :request do
  describe "マイページ" do
    let(:user) { create(:user, :user_image) }

    before do
      sign_in user
      get user_path(user.id)
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to have_http_status(200)
    end

    it "ユーザーの情報が正しく表示されていること" do
      expect(response.body).to include "user_test_email_date", "user_test_name_date", "test.jpg>"
    end
  end

  describe "アカウント情報編集ページ" do
    let(:user) { create(:user, :user_image) }

    before do
      sign_in user
      get edit_user_registration_path
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to have_http_status(200)
    end

    it "ユーザーの情報が正しく表示されていること" do
      expect(response.body).to include "user_test_email_date", "user_test_name_date", "test.jpg>"
    end

    it "入力フォームが表示されていること" do
      expect(response.body).to include "form class=\"edit_user\"", "name=\"user[image]\"", "name=\"user[name]\"",
                                      "name=\"user[email]\"", "name=\"user[password_confirmation]\"", "name=\"user[password]\"",
                                      "name=\"commit\"", "link-below-user-form"
    end
  end
end
