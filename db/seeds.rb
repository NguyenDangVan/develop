User.create!(name: "admin1101",
             email: "admin@gmail.com",
             age: 21,
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true
)

20.times do |n|
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

artist1 = Artist.create!(
  name: "Ed Sheeran",
  info: "Edward Christopher Sheeran, MBE (/ˈʃɪərən/; born 17 February 1991) is an English singer, songwriter, guitarist, record producer, and actor. Sheeran was born in Halifax, West Yorkshire"
)

artist2 = Artist.create!(
  name: "Adam",
  info: "Adam Noah Levine (born March 18, 1979) is an American singer, songwriter and actor. He is the lead singer for the pop rock band Maroon 5. Born and raised in Los Angeles, California, Levine began his musical career in 1994"
)

category = Category.create!(
  name: "US-UK"
)

album1 = Album.create!(
  title: "Album_Adam",
  artist: artist2,
  category: category,
  description: "Adam Levine tên thật là Adam Noah Levine"
)

album2 = Album.create!(
  title: "Album_Ed",
  artist: artist1,
  category: category,
  description: "Edward Christopher Sheeran"
)

album3 = Album.create!(
  title: "Stars",
  artist: artist1,
  category: category,
  description: "All stars on the sky."
)
song1 = Song.create!(
  name: "testSong",
  lyric: "abcdxyz",
  album: album1
)
