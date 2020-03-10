require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "DE" do
  include_context "firefox browser"
    
    it "PROFILE" do
        browser.goto RhapsodyUrl.get(:app)
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 5
      browser.text_field(:id, "username").when_present.set("debeta@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap0000")
      browser.button(:class, "signin").when_present.click
      sleep 15
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 2
        browser.div(:id, "page-header").ul(:class, "content-tabbed-nav hero-tabs").a(:href => "/members/DeBeta").when_present.click
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
      puts "Ubersicht"

        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 1
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Beliebt").when_present.click
        sleep 1
        expect(browser.div(:class, "artist-grid ember-view")).to exist #Artists
        sleep 1
#        browser.div(:class, "artist-grid-item grid-item").a(:href => "/artist/daft-punk").when_present.click
        browser.div(:text, "Daft Punk").when_present.click
        sleep 1
        expect(browser.url).to include("napster.com/artist/")
        expect(browser.div(:class, "artist-container")) .to exist
        expect(browser.div(:class, "artist-content")) .to exist
        expect(browser.div(:class, "show-all-content overview-main-content")) .to exist

        browser.a(:text, "Titel").when_present.click #Tracks
        expect(browser.div(:class, "list")).to exist
        sleep 1

        browser.a(:text, "Alben").when_present.click #Albums
        expect(browser.div(:class, "album-grid ember-view")).to exist
        sleep 1

        browser.a(:href => "/artist/daft-punk/similar-artists").when_present.click #Similar Artists
        expect(browser.div(:class, "artist-grid ember-view")).to exist
        sleep 1

        browser.a(:href => "/artist/daft-punk/listeners").when_present.click #Listeners
        sleep 5
        expect(browser.div(:class, "member-item list-item")).to exist
        sleep 1

        browser.ul(:class, "content-tabbed-nav hero-tabs").a(:text, "Tipps").when_present.click
        expect(browser.div(:class, "artist-content")).to exist
        sleep 1
    puts "Beliebt"

      sleep 2
        browser.div(:class, "nav-profile").when_present.click
      sleep 1
      browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Freunde").when_present.click
      sleep 1
      expect(browser.div(:class, "profile-friends-page mine")).to exist
      expect(browser.div(:class, "activities")).to exist
      expect(browser.div(:class, "profile-friend-followers")).to exist
      sleep 1
    puts "Freunde"

      sleep 2
        browser.div(:class, "nav-profile").when_present.click
      sleep 1
      browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Followed Playlists").when_present.click
      sleep 1
      expect(browser.div(:class, "followed-playlists")).to exist
      expect(browser.div(:class, "playlist-grid-item grid-item public")).to exist
      sleep 1
    puts "Followed Playlists"
  end
  end
  end