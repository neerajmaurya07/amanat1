class VisasController < ApplicationController

  before_action :set_visa, only: [:show, :edit, :update, :destroy, :return, :back]

  def index
  	@q = Mehman.ransack(params[:q])
  	@results = @q.result(distinct: true)
  	@visas = @results.paginate(:page => params[:page], :per_page => 25)
  end

  def show
  end

  def new
  	@visa = Visa.new
  end

  def create
  	@visa = Visa.new(visa_params)
  	if @visa.save?
  	  redirect_to :back, notice: 'Successfully created new Visa!'
  	else
  	  render 'new'
  	end
  end

  private

  def set_visa
  	@visa = Visa.find_by(id: params[:id])
  end

  def visa_params
  	params.require(:visa).permit(:file_no, :submission_date, :apply_date, 
  		:code, :status) 
  end
end
