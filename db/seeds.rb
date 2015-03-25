# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
 project = Project.create({ name: "Default Project", description: "Default Description"})
 test_plan =TestPlan.create({test_plan_name: "Default Test Plan", test_plan_description: "Default Description", project: project})
 admin = Admin.create({email: "admin@default.com", password: "inicial1234", password_confirmation: "inicial1234"})