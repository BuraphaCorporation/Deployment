class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  prepend_before_action :verify_user, only: [:destroy]

  layout 'daydash'

  # GET /resource/sign_in
  def new
    # self.resource = resource_class.new(sign_in_params)
    # store_location_for(resource, params[:redirect_to])
    super
  end

  # POST /resource/sign_in
  def create
    # session[:redirect_to] = params[:continue]
    super
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

protected
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def verify_user
    redirect_to new_user_session_path, notice: 'You have already signed out. Please sign in again.' and return unless user_signed_in?
  end
end
