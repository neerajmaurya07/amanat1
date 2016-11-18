class MehmenController < ApplicationController
  before_action :find_mehman, only: [:show, :edit, :update, :destroy, :return, :back]
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
  	  redirect_to @mehman, notice: "Successfully created new Mehman!"
  	else
  	  render 'new'
  	end
  end

  def edit
  end
  
  def update
    if @mehman.update(mehman_params)
      redirect_to @mehman, notice: "Successfully updated Mehman!"
    else
      render 'edit'
    end
  end
  
  def destroy
    @mehman.destroy
    redirect_to root_path, notice: "Successfully deleted the Mehman!"
  end

  def return
    @mehman = @mehman.returned!
    redirect_to root_path, notice: "Successfully changed status to Returned!"
  end

  def back
    @mehman = @mehman.staying!
    redirect_to root_path, notice: "Successfully changed status to Staying!"
  end

private

  def find_mehman
  	@mehman = Mehman.find(params[:id])
  end

  def mehman_params
  	params.require(:mehman).permit(:code, :full_name, :passport_no, :country, 
  		:arrival_date, :arrival_info, :departure_date, :departure_info, :visa_expiry_date, :status, :level)
  end
end


