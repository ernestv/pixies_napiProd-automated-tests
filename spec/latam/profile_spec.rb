require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "LATAM" do
  include_context "firefox browser"

it "PROFILE", :profile do
        browser.goto RhapsodyUrl.get(:app)
#        browser.a(:id, "nav-signin").click
#       browser.a(:class, "button hide_for_mobile").when_present.click
#       sleep 10
        browser.text_field(:id, "username").when_present.set("brbeta@rhapsody.lan")
        browser.text_field(:id, "password").when_present.set("rhap123")
#       browser.a(:id, "nav-signin").a(:href => '/login').when_present.click
        browser.button(:text, "Log In").click
        sleep 15
        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 2
        browser.ul(:class, "content-tabbed-nav hero-tabs").a(:href, "/members/BrBeta").when_present.click
        sleep 2
        expect(browser.div(:class, "taste-overlap")).to exist
        expect(browser.div(:class, "columns")).to exist
        expect(browser.div(:class, "playlists")).to exist
#        expect(browser.div(:class, "profile-album-collage")).to exist
        expect(browser.div(:class, "profile-overview-page")).to exist
        expect(browser.div(:class, "profile-summary my-profile")).to exist
        expect(browser.ul(:class, "content-tabbed-nav hero-tabs")).to exist
        expect(browser.div(:class, "profile-image")).to exist
        expect(browser.div(:class, "profile-info")).to exist
      puts "Overview"
        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 1
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Mais ouvidos").when_present.click
        sleep 1
        browser.ul(:class, "subtabs header-content expand-horizontal").div(:class, "dropdown-menu ember-view").click
        sleep 1
        browser.li(:text,"Tudo").click
        sleep 2
        browser.a(:text, "Ed Sheeran").when_present.click
  #      browser.div(:class, "artist-grid-item grid-item").when_present.click
        sleep 4
        expect(browser.url).to include("napster.com/artist/")
        expect(browser.div(:class, "artist-container")) .to exist
        expect(browser.div(:class, "artist-content")) .to exist
        expect(browser.div(:class, "show-all-content overview-main-content")) .to exist

=begin
        sleep 1
        browser.li(:id, "ember2839").when_present.click #Tracks
        expect(browser.div(:class, "list")).to exist
        sleep 1

        browser.li(:id, "ember2246").when_present.click #Albums
        expect(browser.div(:class, "ember-view album-grid")).to exist
        sleep 1
=end
        browser.a(:href, "/artist/ed-sheeran/tracks").when_present.click #Tracks
        sleep 2
        expect(browser.div(:class, "artist-tracks-page")).to exist
        expect(browser.div(:class, "track-list-header ember-view")).to exist
        expect(browser.a(:class, "play-button icon-play-button")).to exist
        expect(browser.a(:class, "shuffle-button icon-shuffle2")).to exist
        expect(browser.div(:class, "play-all-text")).to exist
        expect(browser.div(:class, "options-button icon-details_bold")).to exist
        expect(browser.div(:class, "track-filter")).to exist
        sleep 2  
        
        
        
        browser.a(:href, "/artist/ed-sheeran/albums").when_present.click #Albums
        sleep 3
        expect(browser.ul(:class, "subtabs")).to exist
        expect(browser.div(:id, "albums")).to exist
        expect(browser.div(:class, "album-grid ember-view")).to exist
        sleep 2

        browser.a(:href, "/artist/ed-sheeran/similar-artists").when_present.click #Similar Artists
        sleep 3
#        expect(browser.ul(:class, "subtabs")).to exist
        expect(browser.div(:id, "similar-artists")).to exist
        expect(browser.div(:class, "artist-grid ember-view")).to exist
        sleep 2

        browser.li(:text, "Ouvintes").when_present.click #Listeners
        sleep 5
        expect(browser.div(:class, "member-item list-item")).to exist
        sleep 2
  
        browser.li(:text, "Destaques").when_present.click #Posts
#        expect(browser.div(:class, "ember-view member-grid")).to exist
        expect(browser.div(:class, "artist-content")).to exist
        sleep 2

#        browser.ul(:class, "content-tabbed-nav hero-tabs").a(:text, "Featured").when_present.click
#        expect(browser.div(:class, "artist-content")).to exist
#        sleep 1

        browser.div(:class, "nav-profile").when_present.click
        sleep 2
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Mais ouvidos").when_present.click
        sleep 2
#        browser.link(:id, "ember3035").when_present.click #Albums
#        sleep 1
#        expect(browser.div(:class, "ember-view album-grid")).to exist
#        sleep 1
#        browser.link(:id, "ember3036").when_present.click #Tracks
#        sleep 1
#        expect(browser.div(:class, "chart-tracks")).to exist
#        sleep 1
    puts "Charts"

      sleep 1
      browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Amigos").when_present.click
      sleep 1
      expect(browser.div(:class, "activity-filter ember-view")).to exist
      expect(browser.div(:class, "profile-friend-followers")).to exist
      sleep 1
    puts "Friends"

      sleep 1
      browser.ul(:class, "content-tabbed-nav hero-tabs").a(:href,"/members/BrBeta/playlists/followed").when_present.click
      sleep 1
      expect(browser.div(:class, "followed-playlists")).to exist
      sleep 1
    puts "Followed Playlists"
    
  end
  end
  end