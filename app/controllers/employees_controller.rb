class EmployeesController < ApplicationController
  before_filter :authenticate_employee!
  
  def index
    @points = current_employee.points
    respond_to do |format|
      format.html
      format.json { render json: @points }
    end
  end
  
end
