require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "VIVO" do
  include_context "firefox browser"

  describe "GENERAL", :general do

    it "Profile" do
      browser.goto RhapsodyUrl.get(:appvivo)
#      browser.a(:id, "nav-signin").click
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 10
      browser.text_field(:id, "username").when_present.set("5511111111199")
      browser.text_field(:id, "password").when_present.set("111199")
#      browser.a(:id, "nav-signin").a(:href => '/login').when_present.click
      browser.button(:class, "signin").when_present.click
      sleep 15
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
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
      sleep 5
      expect(browser.url) .to include ("napster.com/library")
      expect(browser.div(:class, "library-artists scroll-column scroll-under-player")).to exist
#      expect(browser.div(:class, "library-artist scroll-content main-scroll")).to exist
    end

    it "Favorites" do
      browser.div(:class, "nav-item nav-favorites").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/favorites")
      expect(browser.div(:class, "favorites-page main-scroll scroll-content")).to exist
    end

    it "History" do
      browser.div(:class, "nav-item nav-listening-history").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/listening-history")
      expect(browser.div(:class, "listening-history-page scroll-content main-scroll")).to exist
    end

    it "Radio" do
      browser.div(:class, "nav-item nav-radio").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/radio")
      expect(browser.div(:class, "radio-pages expand-content")).to exist
    end

    it "Featured" do
      browser.div(:class, "nav-item nav-blog").when_present.click
      sleep 1
      expect(browser.url) .to include ("napster.com/blog")
      expect(browser.div(:class, "post-pages expand-content")).to exist
    end

   it "Playback" do
      browser.div(:id, "home-logo").click
      sleep 2
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
      sleep 2
      browser.div(:class, "replay-carousel ember-view").div(:class, "play-button icon-play-button").when_present.click
      sleep 2
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
      browser.goto RhapsodyUrl.get(:vivo,)
      sleep 10
      browser.div(:class, "nav-item nav-help").when_present.click
      browser.windows.last.use
      sleep 4
      expect(browser.url) .to include ("vivo.com.br") #http://www.napster.com/help <- for US
#      expect(browser.div(:class, "wrapper-mains")).to exist
    end

    it "New" do
      browser.goto RhapsodyUrl.get(:vivo,)
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

    it "Settings" do
      browser.goto RhapsodyUrl.get(:appvivo,)
      sleep 10
      browser.text_field(:id, "username").when_present.set("5511111111199")
      browser.text_field(:id, "password").when_present.set("111199")
      browser.button(:class, "signin").when_present.click
      sleep 15
      browser.div(:class, "nav-item nav-settings").when_present.click
      browser.windows.last.use
      sleep 4
      expect(browser.url) .to include ("napster.com/settings/general")
      expect(browser.div(:class, "settings-pages expand-content")).to exist
    end
  end
end
end