require 'rails_helper'

RSpec.describe "Halls", type: :request do
  before do
    @params = {}
    @params[:q] = {}
    @params[:q][:name_or_address_cont] = 'あああ'
  end

  describe "ビリヤード場一覧" do
    let(:hall) { create(:hall, :hall_image) }
    let(:user) { create(:user) }
    let(:reviews) { nil }

    before do
      get billisearch_halls_path(@params)
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to have_http_status(200)
    end
  end

  describe "ビリヤード場詳細" do
    let!(:hall) { create(:hall, :hall_image) }
    let!(:user) { create(:user) }
    let!(:reviews) { nil }

    before do
      get billisearch_hall_path(hall.id)
    end

    it "正常にレスポンスを返すこと" do
      expect(response).to have_http_status(200)
    end

    it "ビリヤード場の情報が表示されていること" do
      expect(response.body).to include hall.name, hall.address, hall.address, hall.tel,
                                        hall.email, hall.price, hall.time, hall.parking,
                                        hall.billiards, hall.url, hall.pr, hall.open, hall.lead,
                                        "test.jpg"
    end

    context "口コミの投稿がない場合" do
      it "口コミはありませんと表示されていること" do
        expect(response.body).to include "口コミはありません"
      end
    end

    context "口コミが投稿されている場合" do
      it "投稿された口コミが表示されていること" do
        hall.reviews << create(:review, hall: hall)
        get billisearch_hall_path(hall.id)
        expect(response.body).to include "いい店でした。"
      end
    end

    it "口コミ投稿フォームが表示されていること" do
      expect(response.body).to include "form action=\"/reviews\""
    end
  end
end
