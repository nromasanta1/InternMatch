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
    @internship = Internship.new(params)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
