class UsersController < ApplicationController
  # require 'will_paginate/array'
  before_action :find_user, only: [:show, :dashboard, :upvote, :downvote]
  before_action :find_document, only: [:show, :dashboard]


  def index
    if user_signed_in?
      @users = User.all.order(:cached_votes_up => :desc).reject { |u| u.id == current_user.id }
      @users = @users.paginate(:page => params[:page], :per_page => 8)
    else
      @users = User.all.order(:cached_votes_up => :desc).paginate(:page => params[:page], :per_page => 8)
    end
  end

  def show
  end

  def dashboard
  end
  #votos
  def upvote
    @user.upvote_from current_user
    redirect_to users_path
  end
  def downvote
    @user.downvote_from current_user
    redirect_to users_path
  end

  private

  def find_document
    @documents = Document.where(user_id: @user).order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
  end

  def find_user
    if params[:id].nil?
      @user= current_user
    else
      @user = User.find(params[:id])
    end
  end
end
