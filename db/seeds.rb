Artist.create!(
  name: "testArtist"
  )

Category.create!(
  name: "testCate"
  )

Album.create!(
  title: "testAlbum",
  category_id: 1,
  artist_id: 1,
  description: Faker::Lorem.sentence(5)
  )
Song.create!(
  name: "testSong",
  lyric: "abcdxyz",
  album_id: 1
  )


