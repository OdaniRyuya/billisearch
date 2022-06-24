require 'rails_helper'

RSpec.describe Hall, type: :model do

  describe Hall do

    let (:hall) {create(:hall)}

    it "ビリヤード場を登録した時、正常にcreateメソッドが完了すること" do
      expect(hall).to be_valid
    end
  end
end
