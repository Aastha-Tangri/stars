class EmployeeMailer < ActionMailer::Base
  default from: "stars@trantorinc.com"
  
  def received_points(name, email, subject, message)
    @empname = name
    @points = message[:points]
    @given_by = message[:given_by]
    @project = message[:project]
    mail(to: email, subject: subject, reply_to: 'stars@trantorinc.com')
  end
end
