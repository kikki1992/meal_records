class ToppagesController < ApplicationController
  def index
    if logged_in?
      @pet = current_user.pets.build  # form_with 用
      @pets = current_user.pets.order(id: :desc).page(params[:page])
    end
  end
end
