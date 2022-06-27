require 'rails_helper'

RSpec.feature "ビリヤード場一覧", type: :feature do

  describe "ビリヤード場一覧(検索結果)" do

    let!(:hall) {create_list(:hall, 7, :hall_image)}

    background do
      @params = Hash.new
      @params[:q] = Hash.new
      @params[:q][:name_or_address_cont] = 'テスト'
      visit billisearch_halls_path(@params)
    end

    scenario "クリックした店の詳細ページに遷移すること" do
      click_link hall.second.name
      #paginationが新着順で1ページに6件表示なので最初に作成されたテスト店1は表示されない
      expect(current_path).to eq billisearch_hall_path(hall.second.id)
    end


    scenario "店名でキーワード検索ができること" do
      @params[:q][:name_or_address_cont] = 'テスト店8'
      visit billisearch_halls_path(@params)
      expect(page).to have_content("テスト店8")
      expect(page).to have_content("全1件中1件を表示中")
    end  


    scenario "住所でキーワード検索ができること" do
      @params[:q][:name_or_address_cont] = '◯◯県◯◯市◯◯-◯◯番15'
      visit billisearch_halls_path(@params)
      expect(page).to have_content("◯◯県◯◯市◯◯-◯◯番15")
      expect(page).to have_content("全1件中1件を表示中")
    end  
  end  

  describe 'ソートした場合' do

    let!(:hall1) { create(:hall, :hall_image, name: "テスト店1")}
    let!(:hall2) { create(:hall, :hall_image, name: "テスト店2")}
    let!(:hall3) { create(:hall, :hall_image, name: "テスト店3")}

    background do
      @params = Hash.new
      @params[:q] = Hash.new
      @params[:q][:name_or_address_cont] = ''
      visit billisearch_halls_path(@params)
    end

    scenario "検索結果のデフォルトが新着順(DESC)でソートされてること" do
      within '.halls-list' do
      hall_names = all('.halls-item-name').map(&:text)
      expect(hall_names).to eq %w(テスト店3 テスト店2 テスト店1)
      end
    end  

    scenario "新着順(デフォはDESC)をクリックするとASCでソートされること" do
      click_link '新着順'
      within '.halls-list' do
      hall_names = all('.halls-item-name').map(&:text)
      expect(hall_names).to eq %w(テスト店1 テスト店2 テスト店3)
      end
    end  

    scenario "お気に入り順をクリックする度にDESC(最初)とASCで交互にソートされること" do

      hall1.favorites << create_list(:favorite, 2, hall: hall1)
      hall3.favorites << create_list(:favorite, 1, hall: hall3)
      hall2.favorites << create_list(:favorite, 0, hall: hall2)

      click_link 'お気に入り順'

      within '.halls-list' do
      hall_names = all('.halls-item-name').map(&:text)
      expect(hall_names).to eq %w(テスト店1 テスト店3 テスト店2)
      end

      click_link 'お気に入り順'

      within '.halls-list' do
        hall_names = all('.halls-item-name').map(&:text)
        expect(hall_names).to eq %w(テスト店2 テスト店3 テスト店1)
      end
    end  

    scenario "レビュー順をクリックする度にDESC(最初)とASCで交互にソートされること" do
      hall2.reviews << create_list(:review, 2, hall: hall2)
      hall3.reviews << create_list(:review, 1, hall: hall3)
      hall1.reviews << create_list(:review, 0, hall: hall1)
      
      click_link 'レビュー順'
      within '.halls-list' do
      hall_names = all('.halls-item-name').map(&:text)
      expect(hall_names).to eq %w(テスト店2 テスト店3 テスト店1)
      end

      click_link 'レビュー順'
      within '.halls-list' do
        hall_names = all('.halls-item-name').map(&:text)
        expect(hall_names).to eq %w(テスト店1 テスト店3 テスト店2)
      end
    end
  end  

  describe 'お気に入り' do

    let!(:hall1) { create(:hall, :hall_image, name: "テスト店1")}
    let!(:user) {create(:user)}

    background do
      sign_in user
      @params = Hash.new
      @params[:q] = Hash.new
      @params[:q][:name_or_address_cont] = ''
      visit billisearch_halls_path(@params)
    end

    scenario "お気に入りをクリックするとお気に入りの登録と解除ができること" do
      find('.favorite-no-check').click
      expect(hall1.favorites.count).to eq 1
      find('.favorite-check').click
      expect(hall1.favorites.count).to eq 0
    end  
  end  
end  
