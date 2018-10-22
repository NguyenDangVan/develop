User.create!(name: "Nguyen Dang Van",
             email: "dinvvan@gmail.com",
             age: 21,
             password: "123456",
             password_confirmation: "123456",
             admin: true)

49.times do |n|
  name  = FFaker::Name.name
  email = "din-#{n+1}@gmail.com"
  age = 21
  password = "password"
  User.create!(name: name,
               email: email,
               age: age,
               password: password,
               password_confirmation: password)
end
