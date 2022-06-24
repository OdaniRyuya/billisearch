require 'rails_helper'

RSpec.feature "ビリヤード場一覧", type: :feature do

  background do
    @params = Hash.new
    @params[:q] = Hash.new
    @params[:q][:name_or_address_cont] = 'テスト'
    @hall = create_list(:hall, 7, :hall_image)
    visit billisearch_halls_path(@params)
  end

  scenario "クリックした店の詳細ページに遷移すること" do
    click_link 'テスト場テスト店2'
    #paginationが新着順で1ページに6件表示なので最初に作成されたテスト店1は表示されない
    within first("tbody td") do
      expect(page).to have_content("テスト場テスト店2")
    end
  end  
end
