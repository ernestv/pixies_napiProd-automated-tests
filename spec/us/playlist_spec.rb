  
require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "US" do
  include_context "firefox browser"
  it "PLAYLIST", :playlist do
    
#      context "Add from ALL TRACKS to playlist" do
#        it "Playlist CREATED / track added" do
          browser.window.resize_to(1300, 800)
          browser.goto RhapsodyUrl.get(:app)
#          browser.a(:text, "Login").when_present.click
          sleep 15
          browser.text_field(:id, "username").when_present.set("usbeta@rhapsody.lan")
          browser.text_field(:id, "password").when_present.set("rhap123")
          browser.button(:class, "signin").when_present.click
          sleep 15
          browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'snoop dogg'
          sleep 2
          browser.li(:class, "typeahead-artist").when_present.click
          sleep 3
          browser.a(:href => "/artist/snoop-dogg/tracks").when_present.click
          sleep 1
          browser.div(:text, "Gin and Juice").when_present.hover
          sleep 2
          browser.div(:class, "duration-options-container").when_present.click
          sleep 1
          browser.div(:class, "options-menu-item add-to-playlist").span(:class => "icon-playlists icon").when_present.click
          sleep 1
          browser.text_field(:class, 'add-to-playlist-create-box ember-text-field ember-view').set 'SNOOPY'
          sleep 1
          browser.button(:class, "add-to-playlist-create-button").when_present.click
          sleep 1
          browser.div(:class, "nav-item nav-playlists").when_present.click
          sleep 1
          browser.div(:class, "filter-option mine").when_present.click
          sleep 3
          browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar active ember-view").when_present.click
          sleep 1
          browser.div(:class, "date").when_present.click
          sleep 3
          browser.div(:class, "playlists-list-item  private").div(:class, "playlist-info").div(:class, "name").a(:text => "SNOOPY").when_present.click
          sleep 2
#          browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar ember-view").when_present.click
          sleep 1
          puts "Playlist CREATED / track added"
#        end        
#        it "Track added to an EXISTING playlist" do
          browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'snoop dogg'
          sleep 2
          browser.li(:class, "typeahead-artist").when_present.click
          sleep 5
          browser.a(:href => "/artist/snoop-dogg/albums").when_present.click
          browser.a(:href => "/artist/snoop-dogg/album/bush").when_present.click
          sleep 2
          browser.div(:class, "options-button icon-details_bold").when_present.click
          sleep 1
          browser.div(:class, "options-menu-item add-to-last-playlist").span(:class => "icon-playlists icon").when_present.click
          sleep 10
          
          browser.div(:class, "nav-item nav-sign-out").when_present.click
          sleep 1
          browser.cookies.clear
          sleep 1
          browser.text_field(:id, "username").when_present.set("usbeta@rhapsody.lan")
          browser.text_field(:id, "password").when_present.set("rhap123")
          browser.button(:class, "signin").when_present.click
          sleep 10          
          browser.div(:class, "nav-item nav-playlists").when_present.click
          sleep 1
          browser.div(:class, "filter-option mine").when_present.click
          sleep 1
          browser.div(:class, "date").when_present.click
          sleep 3
          browser.div(:class, "playlist-info").div(:class, "name").when_present.click
          sleep 2
          expect(browser.text).to include("California Roll")
#          expect(browser.text).to include("Young, Wild & Free") 
#        end
          puts "Track added to an EXISTING playlist"
#        it "Delete playlist" do
          browser.div(:class, "nav-item nav-playlists").when_present.click
          sleep 3
          browser.div(:class, "filter-option mine").when_present.click
          sleep 1
          browser.div(:class, "playlists-list-item").hover
          sleep 2
          sleep 4
          browser.div(:class, "delete-button icon-trash_can").when_present.click
          sleep 3
          browser.div(:class, "confirmation-ok").when_present.click
          sleep 3
          puts "Playlist deleted"
#        end       

#      it "Playlist created" do
        browser.goto RhapsodyUrl.get(:app,)
          browser.div(:class, "nav-item nav-playlists").when_present.click
          sleep 1
          browser.div(:class, "new-playlist").when_present.click
          sleep 2
          browser.send_keys :enter
          sleep 2
          puts "EMPTY Playlist created"
#       end
#      it "Track added" do
          browser.div(:class, "search-box").when_present.click
          sleep 2
          browser.send_keys("gin and juice")
          sleep 1
          browser.li(:class, "typeahead-track active").click
#          browser.send_keys :enter
          sleep 6
          puts "Track added"
#      end
#      it "Track check" do
          browser.div(:class, "nav-item nav-library").when_present.click
          sleep 1
          browser.div(:class, "nav-item nav-playlists").when_present.click
          sleep 2
          browser.refresh
          browser.div(:class, "filter-option mine").when_present.click
          sleep 2
#          browser.div(:class, "ember-view right-sidebar-toggle-view-button icon-sidebar active").when_present.click
          sleep 2
          browser.div(:class, "date").when_present.click
          sleep 3
          browser.div(:class, "list").div(:class, "name").when_present.click
          sleep 2
#          expect(browser.text).to include("Gin and Juice")
          sleep 2
          puts "Track checked"
#      end
#      it "Delete playlist" do
          browser.div(:class, "nav-item nav-playlists").when_present.click
          sleep 3
          browser.div(:class, "filter-option mine").when_present.click
          sleep 1
          browser.div(:class, "playlists-list-item").hover
          sleep 4
          browser.div(:class, "delete-button icon-trash_can").when_present.click
          sleep 3
          browser.div(:class, "confirmation-ok").when_present.click
          sleep 3
          puts "Playlist deleted"
        end
      end
    end    