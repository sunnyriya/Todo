class RegistrationsController < Devise::RegistrationsController

 def index
 end


 private
  def sign_up_params
     params.require(:user).permit(:email, :password, :password_confirmation,:name, :address, :city, :postal_code)
  end

end