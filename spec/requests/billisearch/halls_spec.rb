require 'rails_helper'

RSpec.describe "Billisearch::Halls", type: :request do

  FactoryBot.define do
    factory :hall do
      user {"aaa"}
    end
  end

  describe "GET /billisearch/home" do
    it "正常にレスポンスを返すこと" do
    binding.pry
      get "/billisearch/home"
      expect(response).to have_http_status(200)
    end
  end
  
end
