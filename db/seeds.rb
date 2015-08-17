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

puts "\nCreate project and test plan examples\n"

project = Project.create(
  { 
    name: "Default Project",
    description: "Default Description"
  }
)

TestPlan.create(
  {
    test_plan_name: "Default Test Plan",
    test_plan_description: "Default Description", 
    project: project
  }
)

puts "\nAdmin Url localhost:3000/admins/sign_in \n"
puts "\nUser Url localhost:3000/users/sign_in \n"
