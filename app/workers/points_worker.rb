class PointsWorker
  include Sidekiq::Worker
  
  def perform(points_id, name, project)
    points = Point.find(points_id)
    appre_emp = Employee.find(points.given_to)
    message = {:points => points.category.stars, :given_by => name, :project => project}
    EmployeeMailer.delay.received_points(appre_emp.name, appre_emp.email, "Congratulations. You received an appreciation.", message)
  end
end