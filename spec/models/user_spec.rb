require 'rails_helper'

RSpec.describe User, type: :model do
  describe User do
    context "新規登録時、有効な属性の値が渡された時" do
      let(:user) { create(:user) }

      it "Userのcreateメソッドが正常に完了すること" do
        expect(user).to be_valid
      end
    end

    context "新規登録時、有効な属性の値が渡されなかった時" do
      let(:user) { User.new(name: nil, email: nil, password: nil) }

      it "バリデーションエラーが出ること" do
        user.valid?
        expect(user.errors.full_messages).to include("メールアドレスが入力されていません。", "パスワードが入力されていません。",
                                                      "名前が入力されていません。")
      end
    end
  end
end
