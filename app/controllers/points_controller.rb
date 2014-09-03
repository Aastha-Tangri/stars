class PointsController < ApplicationController
  before_filter :authenticate_employee!
  
  def index
    @points = current_employee.points_given
    respond_to do |format|
      format.html
      format.json { render json: @points }
    end
  end
  
  def new
    @points = current_employee.points_given.build
    @employees = Employee.where("id != ?", current_employee.id)
  end
  
  def create
    @points = current_employee.points_given.new(points_params)
    respond_to do |format|
      if @points.save
        PointsWorker.perform_async(@points.id, current_employee.name, points_params[:project])
        format.html { redirect_to employee_points_path, notice: 'Appreciation was successfully done.' }
        format.json { render json: employee_points_path, status: :created, location: @points }
      else
        format.html { render action: "new" }
        format.json { render json: @points.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @points = current_employee.points_given.find(params[:id])
  end
  
  private
  def points_params
    params.require(:point).permit(:given_to, :category_id, :project, :task, :comment, :manager)
  end
end
