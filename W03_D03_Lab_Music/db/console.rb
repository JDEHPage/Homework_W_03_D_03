require('pry')
require_relative("../models/album")
require_relative("../models/artist")

Album.delete_all()
Artist.delete_all()


artist1 = Artist.new({'name' => 'Aurora'})
artist2 = Artist.new({'name' => 'Dragon Force'})
artist3 = Artist.new({'name' => 'AC/DC'})
artist1.save()
artist2.save()
artist3.save()


album1 = Album.new({
  'title' => 'Worrior',
  'genera' => 'Alternative Synth pop',
  'artist_id' => artist1.id
  })

album2 = Album.new({
  'title' => 'Fire & Flame',
  'genera' => 'Metal',
  'artist_id' => artist2.id
  })

album3 = Album.new({
  'title' => 'Back in Black',
  'genera' => 'Rock',
  'artist_id' => artist3.id
  })

album4 = Album.new({
  'title' => 'Highway to Hell',
  'genera' => 'Rock',
  'artist_id' => artist3.id
  })
album1.save
album2.save
album3.save
album4.save




      binding.pry
      nil
