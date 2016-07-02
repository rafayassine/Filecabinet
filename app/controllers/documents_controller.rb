class DocumentsController < ApplicationController
  before_action :find_document, only: [:show, :edit, :update, :destroy]

  def index
    @documents = Document.all.order("created_at DESC")
  end

  def create
    @document = Document.new(doc_params)
    if @document.save
      redirect_to @document
    else
      render 'new'
    end
  end

  def new
    @document = Document.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

    def find_document
      @document = Document.find(params[:id])
    end

    def doc_params
      params.require(:document).permit(:title, :content)
    end

end
