class InternshipApplicationsController < ApplicationController
  def index
    if current_user.applicant?
      @applications = InternshipApplication.where(user: current_user)
    elsif current_user.employer?
      @applications = InternshipApplication.joins(internship: :user)
    end
  end

  def show
    @application = InternshipApplication.find(params[:id])
  end

  def new
    @internship = Internship.find(params[:internship_id])
    if current_user.applicant?
      @application = InternshipApplication.new
    else
      @application = []
      redirect_to root_path, status: :unprocessable_entity
    end
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

  def edit
    if current_user.employer?
      @application = InternshipApplication.find(params[:id])
    else
      @application = []
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def update
    @application = InternshipApplication.find(params[:id])
    @application.update(application_params)
    redirect_to internship_applications_path
  end

  private

  def application_params
    params.require(:internship_application).permit(:comment, :status)
  end
end
