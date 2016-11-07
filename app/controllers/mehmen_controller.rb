class MehmenController < ApplicationController
  before_action :find_mehman, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @mehmen = Mehman.staying.search(params[:search])
  end

  def show
  end

  def new
  	@mehman = Mehman.new
  end

  def create
  	@mehman = Mehman.new(mehman_params)

  	if @mehman.save
  	  redirect_to @mehman, notice: "Successfully created new mehman."
  	else
  	  render 'new'
  	end
  end

  def edit
  end
  
  def update
    if @mehman.update(mehman_params)
      redirect_to @mehman, notice: "Successfully updated mehman."
    else
      render 'edit'
    end
  end
  
  def destroy
    @mehman.destroy
    redirect_to root_path, notice: "Successfully deleted the mehman"
  end

  private

  def find_mehman
  	@mehman = Mehman.find(params[:id])
  end

  def mehman_params
  	params.require(:mehman).permit(:code, :full_name, :passport_no, :country, 
  		:arrival_date, :arrival_info, :departure_date, :departure_info, :visa_expiry_date)
  end
end


