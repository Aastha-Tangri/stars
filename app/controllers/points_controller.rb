class PointsController < ApplicationController
  before_filter :authenticate_employee!
  def index
    
  end
  
  def new
    @points = Points.new
  end
  
  def create
    
  end
end
