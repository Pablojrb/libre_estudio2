class UsersController < ApplicationController
  before_action :find_user, only: [:show, :dashboard]
  before_action :find_document, only: [:show, :dashboard]

  def index
    @users = User.all.order("created_at DESC")
  end

  def show

  end

  def dashboard

  end

  private

  def find_document
    @documents = Document.where(user_id: @user).order("created_at DESC")
  end

  def find_user
    if params[:id].nil?
        @user= current_user
    else
      @user = User.find(params[:id])
    end
  end
end
