class PointsController < ApplicationController
  before_filter :authenticate_employee!
  
  def index
    @points = Point.where("given_by = ?", current_employee.ecode)
    respond_to do |format|
      format.html
      format.json { render json: @points }
    end
  end
  
  def new
    @points = Point.new
    @employees = Employee.where("ecode != ?", current_employee.ecode)
  end
  
  def create
    @points = Point.new(points_params)
    @points.given_by = current_employee.ecode
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
    @points = Point.find(params[:id])
  end
  
  private
  def points_params
    params.require(:points).permit(:given_to, :given_by, :category_id, :project, :task, :comment, :manager)
  end
end
