# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin_user = User.create(name: 'Admin User', email: 'admin_user@gmail.com', password: '12345678', mobile: '8888888888',
                         city: 'surat', country: 'india', address: 'test address', postcode: '440044', is_admin: true)
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
