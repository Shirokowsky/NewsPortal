class UsersController < ApplicationController
  before_action :authenticate_user!
  def edit
    @articles = current_user.articles
  end
end