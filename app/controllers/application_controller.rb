class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:destroy, :edit, :update]
  protect_from_forgery with: :exception
end
