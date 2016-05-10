class GreetingsController < ApplicationController
  before_action :need_sign_in, only: :hello

  def hello
    @user = current_user
  end

  private
    def need_sign_in
      redirect_to new_user_session_path unless user_signed_in?
    end
end
