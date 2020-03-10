require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "VIVO" do
  include_context "firefox browser"

it "PROFILE", :profile do
        browser.goto RhapsodyUrl.get(:appvivo)
#      browser.a(:id, "nav-signin").click
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 10
      browser.text_field(:id, "username").when_present.set("5511111111199")
      browser.text_field(:id, "password").when_present.set("111199")
#      browser.a(:id, "nav-signin").a(:href => '/login').when_present.click
      browser.button(:text, "Login").click
      sleep 15
        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 2
        browser.ul(:class, "content-tabbed-nav hero-tabs").a(:href, "/members/weeman").when_present.click
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
        browser.a(:text, "Eminem").when_present.click
#        browser.div(:class, "artist-grid-item grid-item").a(:href => "/artist/amy-winehouse").when_present.click
        sleep 1
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
        browser.li(:text, "Artistas semelhantes").when_present.click #Similar Artists
        sleep 1
        expect(browser.div(:class, "artist-grid ember-view")).to exist
        sleep 1

        browser.li(:text, "Ouvintes").when_present.click #Listeners
        sleep 5
        expect(browser.div(:class, "member-item list-item")).to exist
        sleep 1
  
        browser.li(:text, "Destaques").when_present.click #Posts
        sleep 2
        expect(browser.div(:class, "post-container")).to exist
#        expect(browser.div(:class, "icon icon-featured3")).to exist
        sleep 1

#        browser.ul(:class, "content-tabbed-nav hero-tabs").a(:text, "Featured").when_present.click
#        expect(browser.div(:class, "artist-content")).to exist
#        sleep 1

        browser.div(:class, "nav-profile").when_present.click
        sleep 1
        browser.ul(:class, "content-tabbed-nav hero-tabs").li(:text, "Mais ouvidos").when_present.click
        sleep 1
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
      browser.ul(:class, "content-tabbed-nav hero-tabs").a(:text,"Playlists seguidas").when_present.click
      sleep 1
      expect(browser.div(:class, "followed-playlists")).to exist
      sleep 1
    puts "Followed Playlists"
    
  end
  end
  end