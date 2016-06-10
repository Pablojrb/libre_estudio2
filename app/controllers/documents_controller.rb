class DocumentsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_filter :require_permission, only: [:new, :edit]
  before_action :find_user
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def new
    @document = @user.documents.new
  end

  def create
    @document = @user.documents.new document_params
    if @document.save
        redirect_to user_document_path(@user, @document)
    else
      render 'new'
    end
  end
  def show
    @documents = Document.where(user_id: @user).order("created_at DESC").reject { |d| d.id == @document.id }
  end
  def edit

  end
  def update
    if @document.update document_params
      redirect_to user_document_path(@user, @document), notice: "el documento fue editado con exito!"
    else
      render 'edit'
    end
  end
  def destroy
    @document.destroy
    redirect_to root_path

  end

  private

  def document_params
    params.require(:document).permit(:title, :description)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_document
    @document = Document.find(params[:id])
  end

  def require_permission
    @user = User.find(params[:user_id])
    if current_user != @user
      redirect_to root_path, notice: "Lo sentimos, no tienes permiso de ver esa pagina"
    end
  end
end
