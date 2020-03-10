require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "US" do
  include_context "firefox browser"

  describe "RADIO user", :general do

    it "Signin" do
      browser.goto RhapsodyUrl.get(:app,)
#      browser.nav(:class, "right").link(:id, "nav-signin").when_present.click
#      expect(browser.url) .to include ("napster.com/login")
      sleep 5
      browser.text_field(:id, "username").when_present.set("tesa_radio@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("listen")
      browser.button(:class, "signin").when_present.click
      sleep 10
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
    end
     sleep 1

    
    
        it "History" do
      browser.div.exist?(:class, "nav-item nav-listening-history").should != false
#      expect(browser.div(:class, "nav-item nav-listening-history")).not to exist
    end
    
    

    it "Profile" do
      browser.div(:class, "nav-profile").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/members")
      expect(browser.div(:class, "profile-page scroll-content main-scroll")).to exist
    end
    
    it "Private-Public" do
        browser.div(:class, "nav-profile").when_present.click
        sleep 1
        expect(browser.label(:class, "onoffswitch-label")).to exist
        sleep 1
        browser.div(:class, "onoffswitch").when_present.click
        sleep 2
        browser.div(:class, "onoffswitch").when_present.click
        sleep 1
        expect(browser.div(:class, "share-container ember-view")).to exist
    end
    
    it "Playlists" do
      browser.div(:class, "nav-item nav-playlists").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/playlists")
      expect(browser.div(:class, "playlists-page main-scroll scroll-content")).to exist
      expect(browser.div(:class, "playlists-hero header-content expand-horizontal")).to exist
      expect(browser.div(:class, "playlists-list public")).to exist
    end

    it "Library" do
      browser.div(:class, "nav-item nav-library").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/library")
      expect(browser.div(:class, "library-artists scroll-column scroll-under-player")).to exist
      expect(browser.div(:class, "library-artist scroll-content main-scroll")).to exist
    end

    it "Favorites" do
      browser.div(:class, "nav-item nav-favorites").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/favorites")
      expect(browser.div(:class, "favorites-page main-scroll scroll-content")).to exist
    end

    context "Radio" do
      it "Overview" do
        browser.goto RhapsodyUrl.get(:app,)
#        browser.nav(:class, "right").link(:id, "nav-signin").when_present.click
#        expect(browser.url) .to include ("napster.com/login")
        sleep 5
        browser.text_field(:id, "username").when_present.set("usbeta@rhapsody.lan")
        browser.text_field(:id, "password").when_present.set("rhap123")
        browser.button(:class, "signin").when_present.click
        sleep 10
        browser.div(:class, "nav-item nav-radio").when_present.click
        sleep 1
        expect(browser.url) .to include ("napster.com/radio")
        expect(browser.div(:class, "radio-pages expand-content")).to exist
        expect(browser.div(:class, "featured-station")).to exist
        expect(browser.div(:class, "recent-stations")).to exist
        expect(browser.div(:class, "custom-radio")).to exist
        expect(browser.div(:class, "search-box")).to exist
      end
    
      it "Browse by Genre" do
        browser.ul(:class, "content-tabbed-nav").a(:text, "Browse by Genre").when_present.click
        sleep 1
        expect(browser.div(:class, "genre-list")).to exist
        expect(browser.div(:class, "radio-station-list scroll-under-player")).to exist
        browser.div(:text, "Rock").when_present.click
        sleep 1
        expect(browser.url).to include("napster.com/radio/genres/genre/rock")
        expect(browser.div(:class, "genre-list")).to exist
        expect(browser.div(:class, "radio-station-list scroll-under-player")).to exist
    end
      
      it "Saved Stations" do
        browser.ul(:class, "content-tabbed-nav").a(:text, "Saved Stations").when_present.click
        sleep 1
        expect(browser.div(:class, "my-stations scroll-content main-scroll")).to exist
    end
   end  

    it "Featured" do
      browser.div(:class, "nav-item nav-blog").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/blog")
      expect(browser.div(:class, "post-pages expand-content")).to exist
    end

    it "Labels" do
      browser.div(:class, "nav-item nav-labels").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/label")
      expect(browser.div(:class, "labels-page scroll-content main-scroll")).to exist
    end

    it "Playback" do
      browser.div(:class, "nav-item nav-playlists").when_present.click
      sleep 1
      browser.div(:class, "list").div(:class, "playlist-image").when_present.click
      sleep 1
    end

    it "Play-Pause" do
      browser.div(:id, "ember2312").div(:class, "ember-view track-list-header delete-mode")
      browser.div(:class, "player-play-button").when_present.click
      sleep 1
      browser.div(:class, "player-play-button").when_present.click
      sleep 1
    end	

    it "Hide Mixer" do
      browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar active ember-view").when_present.click
#      browser.div(:id, "ember1185").when_present.click
      sleep 1
      browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar ember-view").when_present.click
#      browser.div(:id, "ember1185").when_present.click
      sleep 1
      browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar active ember-view").when_present.click
      sleep 1
      browser.div(:class, "two-col padded  nav-open mixer-open").present?
    end

    it "Fullscreen" do
      browser.div(:class, "icon-window_out2 full-screen-button").when_present.click
      sleep 1
      browser.div(:class, "ember-view application-view full-screen-mode").present?
      sleep 1
      browser.div(:class, "icon-window_in2 full-screen-button").when_present.click
      sleep 1
    end

    it "Next-Previous" do
      browser.div(:class, "player-advance-button icon-next2").when_present.click
      sleep 1
      browser.div(:class, "player-advance-button icon-next2").when_present.click
      sleep 1
    end

    it "Help" do
      browser.goto RhapsodyUrl.get(:app,)
      sleep 10
      browser.div(:class, "nav-item nav-help").when_present.click
      browser.windows.last.use
      sleep 4
      expect(browser.url) .to include ("http://us.napster.com/availability")
    end

    it "New" do
      browser.goto RhapsodyUrl.get(:app,)
      sleep 10
      browser.div(:class, "nav-item nav-release").when_present.click
      browser.windows.last.use
      sleep 4
      expect(browser.url) .to include ("napster.com/whats-new/features")
      expect(browser.div(:class, "features")).to exist
      expect(browser.div(:class, "feature playlists-bg")).to exist
      expect(browser.div(:class, "feature profile-bg")).to exist
      expect(browser.div(:class, "feature profile-bg")).to exist
      expect(browser.div(:class, "feature player-bg")).to exist
    end

    it "Feedback" do
      browser.div(:class, "nav-item nav-feedback").when_present.click
      sleep 4
      browser.windows.last.use
      sleep 4
      expect(browser.url) .to include ("help.napster.com")
#      expect(browser.div(:class, "ss-form-entry")).to exist
    end

    it "Settings" do
      browser.goto RhapsodyUrl.get(:app,)
      sleep 10
      browser.div(:class, "nav-item nav-settings").when_present.click
      browser.windows.last.use
      sleep 4
      expect(browser.url) .to include ("napster.com/settings/general")
      expect(browser.div(:class, "settings-pages expand-content")).to exist
    end
    
    it "Log Out" do
      browser.div(:class, "nav-item nav-sign-out").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/login/")
      sleep 1
    end  
      
   end   
  end
end