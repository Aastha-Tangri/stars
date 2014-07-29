class PointsController < ApplicationController
  before_filter :authenticate_employee!
  
  def index
    @points = current_employee.points
    respond_to do |format|
      format.html
      format.json { render json: @points }
    end
  end
  
  def new
    @points = current_employee.points.build
    @employees = Employee.where("ecode != ?", current_employee.ecode)
  end
  
  def create
    @points = current_employee.points.create!(points_params)
    respond_to do |format|
      if @points.save
        format.html { redirect_to points_path, notice: 'Appreciation was successfully done.' }
        format.json { render json: points_path, status: :created, location: @points }
      else
        format.html { render action: "new" }
        format.json { render json: @points.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def edit
    @points = current_employee.points.find(params[:id])
  end
  
  private
  def points_params
    params.require(:point).permit(:given_to, :category_id, :project, :task, :comment, :manager)
  end
end
