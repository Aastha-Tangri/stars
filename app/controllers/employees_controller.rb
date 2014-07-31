class EmployeesController < ApplicationController
  before_filter :authenticate_employee!
  
  def index
    @points = current_employee.points
    if @points
      total_points = []
      @points.each do |point|
        total_points << point.category.stars
      end
      @total = total_points.sum
    else
      flash[:notice] = "No points yet!"
    end
    respond_to do |format|
      format.html
      format.json { render json: @points }
    end
  end
  
end
