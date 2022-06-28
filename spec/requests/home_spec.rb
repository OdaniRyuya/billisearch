require 'rails_helper'

RSpec.describe "Home", type: :request do
  before do
    get billisearch_home_path
  end

  describe "ホーム画面" do
    it "正常にレスポンスを返すこと" do
      expect(response).to have_http_status(200)
    end
  end
end
