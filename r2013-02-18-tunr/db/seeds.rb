Genre.delete_all
Song.delete_all
Album.delete_all
Artist.delete_all
User.delete_all
Mixtape.delete_all

u1 = User.create(:balance => 352.81, :name => 'Bob', :image => 'http://sigmaifa.co.uk/images/team-large/damon-george.jpg', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:balance => 250.21, :name => 'Alice', :image => 'http://stlpwa.org/images/site/home-slideshow/professional-woman-4.jpg', :password => 'a', :password_confirmation => 'a')
u3 = User.create(:balance => 311.46, :name => 'Sue', :image => 'http://www.cdc.gov/ncbddd/pediatricgenetics/images/pediatric-genetics-woman.jpg', :password => 'a', :password_confirmation => 'a')
u4 = User.create(:balance => 989.98, :name => 'Admin', :image => 'http://openclipart.org/image/800px/svg_to_png/174534/administrator.png', :password => 'a', :password_confirmation => 'a')
u4.is_admin = true
u4.save
