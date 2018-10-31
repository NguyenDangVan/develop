
User.create! name: "admin1101",
             email: "admin@gmail.com",
             age: 21,
             password: "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true


User.create!(
  name: "man1",
  email: "man1@yahoo.com",
  age: 21,
  password: "123456",
  password_confirmation: "123456",
  activated: true
)

User.create!(
  name: "man2",
  email: "man2@yahoo.com",
  age: 21,
  password: "123456",
  password_confirmation: "123456",
  activated: true
)

20.times do |n|
  name  = FFaker::Name.name
  email = "din-#{n+1}@gmail.com"
  age = 21
  password = "password"
  User.create! name: name,
               email: email,
               age: age,
               password: password,
               password_confirmation: password
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
artist4= Artist.create!(
  name: "Secret Base",
  info: "artist from Japanese"
)

category1 = Category.create! name: "US-UK"

category2 = Category.create! name: "K-Pop"

category3 = Category.create! name: "V-Pop"

category4 = Category.create! name: "J-Pop"

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
album5 = Album.create!(
  title: "Album J-Pop",
  artist: artist4,
  category: category4,
  description: "Japan song"
)

song1 = Song.create!(
  name: "Girls like you",
  lyric: "Từ góc nhìn chuyên môn, một số stylist cho rằng mặc váy rách như trên đến nơi công cộng quá phản cảm. Trang phục phải phù hợp với địa điểm, hoàn cảnh và người mặc cùng yếu tố thẩm mỹ nữa. Mà bộ trang phục này hoàn toàn không phù hợp với bất cứ tiêu chí nào. Không phù hợp với hoàn cảnh, địa điểm, cũng như phom dáng của người mặc, làm lộ các điểm nhạy cảm của cơ thể một cách vô duyên. Về yếu tố thẩm mỹ thì đường cut- out ở vị trí không tinh tế, không hề tạo ra yếu tố gợi cảm chỉ đơn thuần làm phô lộ cơ thể, stylist An Mi nói. ",
  album: album1
)
song2 = Song.create!(
  name: "Lac troi",
  lyric: "...",
  album: album1
)
song3 = Song.create!(
  name: "Suger",
  lyric: "...............",
  album: album2
)
song4 = Song.create!(
  name: "haruharu",
  lyric: "...............",
  album: album3
)

testsong = Song.create!(
  name: "testSong",
  lyric: "abcdxyz",
  album: album1
  )
testplaylist1 = Playlist.create!(
  title: "testPlaylist1",
  user: User.find(1),
  description: FFaker::Lorem.sentence(2)
  )
testplaylist2 = Playlist.create!(
  title: "testPlaylist2",
  user: User.find(2),
  description: FFaker::Lorem.sentence(2)
  )
plistsong1 = PlaylistSong.create!(
  playlist: testplaylist2,
  song: testsong
  )
20.times do |n|
  title  = FFaker::Name.name,
  description = FFaker::Lorem.sentence(2)
  Playlist.create!(
    title: title,
    user: User.find(2),
    description: description)
end
