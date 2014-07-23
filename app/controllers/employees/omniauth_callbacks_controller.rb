class Employees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include ApplicationHelper

  def facebook

    # Attempt to find the User
    @employee = Employee.find_for_facebook_oauth(request.env["omniauth.auth"], current_employee)

    if @employee.persisted?
      sign_in_and_redirect @employee, :event => :authentication # This will throw if @employee is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      #session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_employee_registration_url
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end

end
