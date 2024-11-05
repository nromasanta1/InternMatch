class InternshipApplicationsController < ApplicationController
  def index
    @applications = InternshipApplication.where(user: current_user)
  end
end
