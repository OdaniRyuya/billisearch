class BillisearchController < ApplicationController

  def home
  end

  def new_guest
    user = User.find_or_create_by(email: 'new_user@example.com') do |user|
    user.password = SecureRandom.urlsafe_base64
    user.name = "ゲスト"
    user.image = "/assets/profile-image.png"
    binding.pry
  end
    sign_in user
    redirect_to billisearch_home_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
