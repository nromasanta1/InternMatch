class InternshipApplicationsController < ApplicationController
  def index
    @applications = InternshipApplication.where(user: current_user)
  end

  def new
    @internship = Internship.find(params[:internship_id])
    @application = InternshipApplication.new
  end

  def create
    @internship = Internship.find(params[:internship_id])
    @application = InternshipApplication.new(application_params)
    @application.internship = @internship
    @application.application_date = Date.current
    @application.user = current_user
    if @application.save
      redirect_to internship_applications_path
    else
      render :create, status: :unprocessable_entity
    end

  end

  private

  def application_params
    params.require(:internship_application).permit(:comment)
  end
end
