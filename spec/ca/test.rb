require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "CA" do
  include_context "firefox browser"

    it "PROFILE" do
      browser.goto RhapsodyUrl.get(:app,)
#      browser.nav(:class, "right").link(:id, "nav-signin").when_present.click
#      expect(browser.url) .to include ("napster.com/login")
      sleep 5
      browser.text_field(:id, "username").when_present.set("qatestCA5@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("qwerty")
      browser.button(:class, "signin").when_present.click
      sleep 10
      expect(browser.div(:class, "scroll-content main-scroll")).to exist

        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 2
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Overview").when_present.click
        sleep 2
        expect(browser.div(:class, "taste-overlap")).to exist
        expect(browser.div(:class, "columns")).to exist
        expect(browser.div(:class, "playlists")).to exist
        expect(browser.div(:class, "profile-album-collage")).to exist
        expect(browser.div(:class, "profile-overview-page")).to exist
        expect(browser.div(:class, "profile-summary my-profile")).to exist
        expect(browser.ul(:class, "content-tabbed-nav hero-tabs")).to exist
        expect(browser.div(:class, "profile-image")).to exist
        expect(browser.div(:class, "profile-info")).to exist
      puts "Overview"

        
        sleep 1
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Charts").when_present.click
        sleep 1
        expect(browser.div(:class, "artist-grid ember-view")).to exist #Artists
        sleep 1
        browser.a(:text, "Snoop Dogg").when_present.click
        sleep 2
#        browser.div(:class, "artist-grid-item grid-item").when_present.click
#        sleep 1
        expect(browser.url).to include("napster.com/artist/")
        expect(browser.div(:class, "artist-container")) .to exist
        expect(browser.div(:class, "artist-content")) .to exist
        expect(browser.div(:class, "show-all-content overview-main-content")) .to exist

        browser.a(:text, "Tracks").when_present.click #Tracks
        expect(browser.div(:class, "list")).to exist
        sleep 1

        browser.a(:text, "Albums").when_present.click #Albums
        expect(browser.div(:class, "album-buttons grid-buttons-only")).to exist
        sleep 3

        browser.a(:text, "Similar Artists").when_present.click #Similar Artists
        expect(browser.div(:class, "artist-grid ember-view")).to exist
        sleep 1

        browser.a(:text, "Listeners").when_present.click #Listeners
        sleep 5
        expect(browser.div(:class, "member-item list-item")).to exist
        sleep 1

        browser.ul(:class, "content-tabbed-nav hero-tabs").a(:text, "Featured").when_present.click
        expect(browser.div(:class, "artist-content")).to exist
        sleep 1

        browser.div(:class, "nav-profile").when_present.click
        sleep 1
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Charts").when_present.click
        sleep 1
        browser.a(:text, "Albums").when_present.click #Albums
        sleep 1
        expect(browser.div(:class, "album-grid ember-view")).to exist
        sleep 1
        browser.a(:text, "Tracks").when_present.click #Tracks
        sleep 1
        expect(browser.div(:class, "chart-tracks")).to exist
        sleep 1
        puts "Charts"

      sleep 1
      browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Friends").when_present.click
      sleep 1
      expect(browser.div(:class, "profile-friends-page mine")).to exist
      expect(browser.div(:class, "activities")).to exist
      expect(browser.div(:class, "profile-friend-followers")).to exist
      sleep 1
      puts "Friends"

      sleep 1
      browser.ul(:class, "content-tabbed-nav hero-tabs").a(:href => "/members/canadauser1/playlists/followed").when_present.click
#      browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Followed Playlists").when_present.click
      sleep 3
#      expect(browser.div(:class, "icon icon-playlists")).to exist #when there's no playlists
      expect(browser.div(:class, "followed-playlists")).to exist
      expect(browser.div(:class, "playlist-grid-item grid-item public")).to exist
      expect(browser.div(:class, "image")).to exist
      puts "Followed Playlists"
  end
   end
  end