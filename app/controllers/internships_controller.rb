class InternshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @internships = Internship.all
  end

  def show
    @internship = Internship.find(params[:id])
  end

  def new
    @internship = Internship.new
  end

  def create
    @internship = Internship.new(internship_params)
    if @internship.save
      redirect_to internship_path(@internship)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @internship = Internship.find(params[:id])
  end

  def update
    @internship = Internship.find(params[:id])
    @internship.update(params[:internship])
  end

  def destroy
    @internship = Internship.find(params[:id])
    @internship.destroy
  end
end

private

def internship_params
  params.require(:internship).permit(:name, :role, :location, :start_date, :end_date, :compensation, :description)
end
