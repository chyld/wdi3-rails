Satellite.delete_all
Planet.delete_all

earth = Planet.create(name: 'Earth', image: 'http://www.shadedrelief.com/natural3/images/earth.jpg')
mars = Planet.create(name: 'Mars', image: 'http://www.hoax-slayer.com/images/mars.jpg')
jupiter = Planet.create(name: 'Jupiter', image: 'http://www.nasa.gov/centers/langley/images/content/709568main_jupiter-800x755.jpg')

moon = Satellite.create(name: 'Moon', period: 29, diameter: 134, distance: 167, image: 'http://i.space.com/images/i/000/005/980/i02/moon-watching-night-100916-02.jpg?1294154541')
phobos = Satellite.create(name: 'Phobos', period: 45, diameter: 456, distance: 964, image: 'http://apod.nasa.gov/apod/image/phobos.gif')
deimos = Satellite.create(name: 'Deimos', period: 23, diameter: 752, distance: 125, image: 'http://apod.nasa.gov/apod/image/0903/deimos_hirise.jpg')
io = Satellite.create(name: 'Io', period: 12, diameter: 424, distance: 353, image: 'http://nssdc.gsfc.nasa.gov/image/planetary/jupiter/gal_io2_47971.jpg')
europa = Satellite.create(name: 'Eurpoa', period: 33, diameter: 112, distance: 223, image: 'http://i.space.com/images/i/000/004/682/i02/051019_europa_02.jpg')

earth.satellites = [moon]
mars.satellites = [phobos, deimos]
jupiter.satellites = [io, europa]
