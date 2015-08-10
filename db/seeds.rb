puts "\nCreate default admin to use the system\n"

admin = Admin.create(
  {
    email: "admin@default.com",
    password: "inicial1234",
    password_confirmation: "inicial1234"
  }
)

puts "Login #{admin.email}"
puts "Pass  #{admin.password}"

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

puts "\nUrl localhost:3000/admins/sign_in \n"
