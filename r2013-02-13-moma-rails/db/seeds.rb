Artist.delete_all
Painting.delete_all

Artist.create(:name => 'Vincent van Gogh', :nationality => 'Dutch', :dob => '3/2/1795', :period => 'Renaissance', :image => 'http://cdn.theatlantic.com/static/mt/assets/science/vangogh_photo.jpg')
Artist.create(:name => 'Pablo Picasso', :nationality => 'Spain', :dob => '5/3/1686', :period => 'Impressionistic', :image => 'http://cdn.enjoyourholiday.com/wp-content/uploads/2012/10/Picasso-portrait.jpg')
Artist.create(:name => 'Salvador Dali', :nationality => 'Spain', :dob => '4/9/1583', :period => 'Modern', :image => 'http://www.biography.com/imported/images/Biography/Images/Profiles/D/Salvador-Dali-40389-2-402.jpg')
Artist.create(:name => 'Claude Monet', :nationality => 'French', :dob => '3/9/1275', :period => 'Post Modern', :image => 'http://www.biography.com/imported/images/Biography/Images/Profiles/M/Claude-Monet-WC-9411771-2-402.jpg')
Artist.create(:name => 'Henri Matisse', :nationality => 'French', :dob => '8/3/1376', :period => 'Realists', :image => 'http://upload.wikimedia.org/wikipedia/commons/thumb/b/b1/Portrait_of_Henri_Matisse_1933_May_20.jpg/220px-Portrait_of_Henri_Matisse_1933_May_20.jpg')

Painting.create(:title => 'Self Portrait', :year => '1245', :medium => 'oil', :style => 'awesome', :image => 'http://www.artcyclopedia.org/art/van-gogh-self.jpg')
Painting.create(:title => 'A Woman', :year => '1656', :medium => 'canvas', :style => 'cool', :image => 'http://www.arttherapyblog.com/uimages/2010/10/picasso_woman_b.jpg')
Painting.create(:title => 'Butterfly Ship', :year => '1837', :medium => 'water colors', :style => 'quick', :image => 'http://www.idealnetworker.com/home/idealnet/public.html/wp-content/uploads/2011/04/art-salvador-dali.jpg')
Painting.create(:title => 'Twilight', :year => '1488', :medium => 'fabric', :style => 'modern', :image => 'http://framingpainting.com/UploadPic/Claude%20Monet/big/Venice%20Twilight.jpg')
Painting.create(:title => 'Lydia', :year => '1734', :medium => 'oil', :style => 'other', :image => 'http://www.arthermitage.org/Henri-Matisse/Portrait-of-Lydia-Delectorskaya.jpg')
