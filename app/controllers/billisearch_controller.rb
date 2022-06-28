class BillisearchController < ApplicationController
  def home
  end

  def new_guest
    user = User.find_or_create_by(email: 'guest@example.com')
    sign_in user
    redirect_to billisearch_home_path
  end
end
