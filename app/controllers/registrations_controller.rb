class RegistrationsController < Devise::RegistrationsController
  def create
    super
    profile_picture = Cloudinary::Uploader.upload(params[:profile_picture],
                                                  transformation: [{ width: 500, height: 500, crop: :fill }])
  end

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :industry, :contact_number, :location, :email, :password,
                                 :user_type, :profile_picture)
  end
end
