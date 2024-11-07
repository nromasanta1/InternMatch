class InternshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @internships = Internship.all
  end

  def my_index
    @my_internships = Internship.where(user: current_user)
  end

  def show
    @internship = Internship.find(params[:id])
  end

  def new
    @internship = Internship.new
  end

  def create
    @internship = Internship.new(internship_params)

    @internship.user = current_user

    if @internship.save
      redirect_to @internship, notice: 'Internship was successfully created.'
    else
      logger.debug "Internship errors: #{@internship.errors.full_messages}"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @internship = Internship.find(params[:id])
  end

  def update
    @internship = Internship.find(params[:id])

    if @internship.update(internship_params)
      redirect_to internship_path(@internship)
    else
      render :edit
    end
  end

  def destroy
    @internship = Internship.find(params[:id])
    @internship.destroy
  end
end

private

def ensure_employer
  unless current_user.employer?
    redirect_to root_path, alert: 'You must be an employer to create an internship.'
  end
end

def internship_params
  params.require(:internship).permit(:title, :role, :location, :start_date, :end_date, :compensation, :description)
end
