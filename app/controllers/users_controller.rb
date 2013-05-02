class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@pins = @user.pins.order("created_at desc").page(params[:page]).per_page(20)
  end

  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @user }
    format.js
  end
end
