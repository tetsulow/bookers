class ListsController < ApplicationController
  def new
     @list = List.new
  end

  def create
     @list = List.find(params[:id])
    if @list.save
      flash[:alert] = "Book was successfully created."
      redirect_to show_list_path(@list.id)
    else
      @lists=List.all
      render :index
    end
  end


  def update
     @list = List.new(list_params)
    if @list.save
      flash[:alert] = "Book was successfully updated."
      redirect_to show_list_path(@list.id)
    else
       @lists=List.all
      render :index
    end
  end



  def index
    @lists=List.all
    @list=List.new

  end





  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end


    def destroy
    list = List.find(params[:id])
    list.destroy
    flash[:alert] = "Book was successfully destroyed."
    redirect_to list_path
    end


  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
