class MehmenController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_mehman, only: [:show, :edit, :update, :destroy, :return, :back]


  def index
    @q = Mehman.ransack(params[:q])
    @mehmen = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 30)
  end

  def show
  end

  def new
  	@mehman = Mehman.new
    get_session_data
  end

  def create
  	@mehman = Mehman.new(mehman_params.merge(user: current_user))

    if @mehman.save
      set_session_data
      redirect_to :back, notice: 'Successfully created new Mehman!'
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
    if @mehman.update(mehman_params.merge(user: current_user))
      redirect_to :back, notice: 'Successfully updated Mehman!'
    else
      render 'edit'
    end
  end

  def destroy
    @mehman.destroy
    redirect_to :back, notice: 'Successfully deleted the Mehman!'
  end

  def return
    @mehman.update_attributes(user: current_user, status: :returned)
    redirect_to :back, notice: 'Successfully changed status to Returned!'
  end

  def back
    @mehman.update_attributes(user: current_user, status: :staying)
    redirect_to :back, notice: 'Successfully changed status to Staying!'
  end

  private

  def set_mehman
  	@mehman = Mehman.find_by(id: params[:id])
  end

  def mehman_params
  	params.require(:mehman).permit(:code, :full_name, :passport_no, :country, :arrival_date,
                                   :departure_date, :visa_expiry_date, :status, :level)
  end

  def set_session_data
    session[:mehman] = {} unless session[:mehman]
    session[:mehman]['country'] = @mehman.country
    session[:mehman]['arrival_date'] = @mehman.arrival_date
  end

  def get_session_data
    return unless session[:mehman]
    @mehman.country = session[:mehman]['country']
    @mehman.arrival_date = session[:mehman]['arrival_date']
  end
end
