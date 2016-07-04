class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all.order("created_at DESC")
  end

  def create
    @document = @document = current_user.documents.build(doc_params)
    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def new
    @document = current_user.documents.build
  end

  def edit
  end

  def show
  end

  def update
    if @document.update(doc_params)
      redirect_to @doc_params
    else
      render 'edit'
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end

  private

    def find_document
      @document = Document.find(params[:id])
    end

    def doc_params
      params.require(:document).permit(:title, :content)
    end

end
