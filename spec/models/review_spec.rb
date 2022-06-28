require 'rails_helper'

RSpec.describe Review, type: :model do
  describe Review do
    let(:review) { create(:review) }

    it "口コミ内容を入力した時、正常にcreateメソッドが完了すること" do
      expect(review).to be_valid
    end
  end
end
