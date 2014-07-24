class PointsController < ApplicationController
  before_filter :authenticate_employee!
  
  def index
    @points = Points.all
    respond_to do |format|
      format.html
      format.json { render json: @points }
    end
  end
  
  def new
    @points = Points.new
  end
  
  def create
    debugger
    given_by = current_employee.id
    category_id = params[:points][:category_id].to_i
    @points = Points.new(points_params)
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
  
  private
  def points_params
    params.require(:points).permit(:given_to, :given_by, :category_id, :project, :task, :comment, :manager)
  end
end
