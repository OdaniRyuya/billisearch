require 'rails_helper'

RSpec.describe Review, type: :model do

  describe Review do

    it "口コミ内容を入力した時、正常にcreateメソッドが完了すること" do
      @review = create(:review)
      expect(@review).to be_valid
    end
  end
end
