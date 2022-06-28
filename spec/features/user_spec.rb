require 'rails_helper'

RSpec.feature "user", type: :feature do
  describe "マイページ" do
    let!(:user1) { create(:user) }
    let!(:user2) { create(:user, name: "not-login", email: "not-login@email.com") }
    let!(:hall) { create(:hall, :hall_image, name: "テスト店1") }

    background do
      sign_in user1
      hall.favorites << create_list(:favorite, 1, hall: hall, user: user1)
      visit user_path(user1.id)
    end

    scenario "ページにログイン中のユーザー情報が正しく表示されること" do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.email)
    end

    scenario "ユーザーのお気に入り一覧が表示されていること" do
      expect(user1.favorites.count).to eq 1
      expect(page).to have_content(hall.name)
    end

    scenario "お気に入りから詳細ページに遷移できること" do
      click_link hall.name
      expect(current_path).to eq billisearch_hall_path(hall.id)
    end

    scenario "お気に入りを削除できること" do
      find('.favorite-check').click
      expect(hall.favorites.count).to eq 0
      expect(page).not_to have_content(hall.name)
    end
  end

  describe "ユーザー編集" do
    let!(:user1) { create(:user) }
    let!(:guest) { create(:user, name: "guest", email: "guest@example.com") }

    background do
      sign_in user1
      visit user_path(user1)
    end

    scenario "ページにログイン中のユーザー情報が正しく表示されること" do
      expect(page).to have_content(user1.name)
      expect(page).to have_content(user1.email)
    end
  end
end
