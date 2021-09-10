class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    resource.is_a?(Admin) ? admin_tests_path : tests_path
  end
end
