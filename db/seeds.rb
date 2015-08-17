puts "\nCreate default admin to use the system\n"

admin = Admin.create(
  {
    email: "admin@default.com",
    password: "inicial1234",
    password_confirmation: "inicial1234"
  }
)

puts "Admin Login #{admin.email}"
puts "Admin Pass  #{admin.password}"

puts "\nCreate default user"

user = User.create(
  {
    email: "user@default.com",
    password: "inicial1234",
    password_confirmation: "inicial1234"
  }
)

puts "User Login #{user.email}" 
puts "User Pass #{user.password}"

puts "\nCreate project, test plan and test case examples \n"

project = Project.create(
  { 
    name: "Default Project",
    description: "Default Description"
  }
)

test_plan = TestPlan.create(
  {
    test_plan_name: "Default Test Plan",
    test_plan_description: "Default Description", 
    project: project
  }
)

def create_test_cases(tp, num=10, status='Blocked')
  num.times do |tc|
    tc = TestCase.create(
        {
          title: "test example #{tc}",
          description: "test descriptions",
          criticality: "Low",
          time: 12,
          status: status,
          project_id: 1,
        }
    )
    tc.test_plans << tp
    tc.save
  end
end

create_test_cases(test_plan, 10, 'Passed')
create_test_cases(test_plan, 9,'Blocked')
create_test_cases(test_plan, 5, 'Not_Executed')
create_test_cases(test_plan, 4, 'Failure')

puts "\nAdmin Url localhost:3000/admins/sign_in \n"
puts "\nUser Url localhost:3000/users/sign_in \n"
