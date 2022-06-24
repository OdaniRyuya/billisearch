require 'rails_helper'

RSpec.feature "ビリヤード場一覧", type: :feature do

describe "ビリヤード場一覧(検索結果)"

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
    @params[:q][:name_or_address_cont] = 'テスト場テスト店8'
    visit billisearch_halls_path(@params)
    expect(page).to have_content("テスト場テスト店8")
    expect(page).to have_content("全1件中1件を表示中")
  end  

  scenario "住所でキーワード検索ができること" do
    @params[:q][:name_or_address_cont] = '〇〇県〇〇市〇〇-〇〇番15'
    visit billisearch_halls_path(@params)
    expect(page).to have_content("〇〇県〇〇市〇〇-〇〇番15")
    expect(page).to have_content("全1件中1件を表示中")
  end  

  scenario "新着順をクリックするとソートされること" do

  end  

  scenario "お気に入り順をクリックするとソートされること" do

  end  

  scenario "レビュー順をクリックするとソートされること" do

  end

  scenario "ページネーションできること" do

  end  

  scenario "お気に入りをクリックするとお気に入り登録できること" do

  end  

end
