Artist.delete_all
Album.delete_all
Song.delete_all

gaga = Artist.create(name: 'Lady Gaga')
nirvana = Artist.create(name: 'Nirvana')

thefame = Album.create(name: 'The Fame', image: 'thefame.jpg')
unplugged = Album.create(name: 'MTV Unplugged', image: 'unplugged.jpg')

gaga.albums << thefame
nirvana.albums << unplugged

unplugged.songs << Song.create(name: 'About a Girl', position: 1, filename: '01-aboutagirl.mp3')
unplugged.songs << Song.create(name: 'Come as you are', position: 2, filename: '02-comeasyouare.mp3')
unplugged.songs << Song.create(name: 'Jesus was a Sunbeam', position: 3, filename: '03-jesus.mp3')
unplugged.songs << Song.create(name: 'The man who sold the world', position: 4, filename: '04-mansoldtheworld.mp3')
unplugged.songs << Song.create(name: 'Pennyroyal Tea', position: 5, filename: '05-tea.mp3')
unplugged.songs << Song.create(name: 'Dumb', position: 6, filename: '06-dumb.mp3')
unplugged.songs << Song.create(name: 'Polly', position: 7, filename: '07-polly.mp3')
unplugged.songs << Song.create(name: 'On a Plain', position: 8, filename: '08-plain.mp3')
unplugged.songs << Song.create(name: 'Something in the way', position: 9, filename: '09-something.mp3')
unplugged.songs << Song.create(name: 'Plateau', position: 10, filename: '10-plateau.mp3')
unplugged.songs << Song.create(name: 'Oh me', position: 11, filename: '11-ohme.mp3')
unplugged.songs << Song.create(name: 'Lake of fire', position: 12, filename: '12-lakeoffire.mp3')
unplugged.songs << Song.create(name: 'All Apologies', position: 13, filename: '13-apologies.mp3')
unplugged.songs << Song.create(name: 'Where did you sleep last night', position: 14, filename: '14-sleep.mp3')

thefame.songs << Song.create(name: 'Just Dance', position: 1, filename: '01-justdance.mp3')
thefame.songs << Song.create(name: 'Love Game', position: 2, filename: '02-lovegame.mp3')
thefame.songs << Song.create(name: 'Paparazzi', position: 3, filename: '03-paparazzi.mp3')
thefame.songs << Song.create(name: 'Poker Face', position: 4, filename: '04-pokerface.mp3')
