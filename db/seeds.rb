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
  name: "Marron 5",
  info: "Adam Noah Levine (born March 18, 1979) is an American singer, songwriter and actor. He is the lead singer for the pop rock band Maroon 5. He is a member of Maroon 5 group."
)
artist3= Artist.create!(
  name: "Song Tung MTP",
  info: "fan Sky"
)

category1 = Category.create!(
  name: "US-UK"
)
category2 = Category.create!(
  name: "K-Pop"
)
category3 = Category.create!(
  name: "V-Pop"
)

album1 = Album.create!(
  title: "Album_Adam",
  artist: artist2,
  category: category1,
  description: "Adam Levine tên thật là Adam Noah Levine"
)

album2 = Album.create!(
  title: "Album_Ed",
  artist: artist1,
  category: category1,
  description: "Edward Christopher Sheeran"
)

album3 = Album.create!(
  title: "Stars",
  artist: artist1,
  category: category2,
  description: "All stars on the sky............"
)

album4 = Album.create!(
  title: "Stars V-Pop",
  artist: artist3,
  category: category3,
  description: "All songs of sky............... Album SonTung"
)
song1 = Song.create!(
  name: "Girls like you",
  lyric: "Are you",
  album: album1
)
song2 = Song.create!(
  name: "Sugar",
  lyric: "Do you love me",
  album: album1
)
song3 = Song.create!(
  name: "lac troi",
  lyric: "Cu lac ron tan",
  album: album4
)
