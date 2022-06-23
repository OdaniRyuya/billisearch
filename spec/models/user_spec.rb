require 'rails_helper'

RSpec.describe User, type: :model do

  describe User do

    context "新規登録時、有効な属性の値が渡された時" do
      it "Userのcreateメソッドが正常に完了すること" do
        @user = create(:user)
        expect(@user).to be_valid
      end
    end

    context "新規登録時、有効な属性の値が渡されなかった時" do
      it "バリデーションエラーが出ること" do
        @user = User.new(name: nil, email: nil, password: nil)
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。", "パスワードが入力されていません。",
                                                      "名前が入力されていません。")
      end
    end
    
  end
end
