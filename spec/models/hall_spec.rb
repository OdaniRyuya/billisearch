require 'rails_helper'

RSpec.describe Hall, type: :model do

  describe Hall do

    it "ビリヤード場を登録した時、正常にcreateメソッドが完了すること" do
      @hall = create(:hall)
      expect(@hall).to be_valid
    end
  end
end
