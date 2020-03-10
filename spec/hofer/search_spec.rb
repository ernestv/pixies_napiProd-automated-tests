require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "HOFER" do
  include_context "firefox browser"

    context "SEARCH" do
    it "Artist" do
      browser.goto RhapsodyUrl.get(:appho)
#        browser.a(:text, "Login").when_present.click
#        sleep 10
      browser.text_field(:id, "username").when_present.set("qahoferprod20170829@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
      sleep 15
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-artist2").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/artists?query=Maroon")
      browser.div(:class, "artist-grid-item grid-item").when_present.click
      sleep 2
      browser.div(:id, "home-logo").when_present.click
    end

    it "Tracks" do
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-track").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/tracks?query=Maroon")
#      browser.div(:class, "ember-view track-list show-artist").when_present.click
      sleep 2
      browser.div(:id, "home-logo").when_present.click
    end

    it "Albums" do
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-album").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/albums?query=Maroon")
#      browser.div(:text, "Alben").when_present.click
      sleep 2
      browser.div(:id, "home-logo").when_present.click
    end

    it "Featured" do
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
#      browser.div(:class, "item-type-header selectable")
      browser.div(:class, "item-type-icon icon-playlists").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/playlists/featured?query=Maroon")
      sleep 2
      browser.div(:id, "home-logo").when_present.click
    end

    it "Listener Playlists" do
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:text, "User-Playlists").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/playlists/listeners?query=Maroon")
      sleep 2
      browser.div(:id, "home-logo").when_present.click
    end

=begin
    it "Genre" do
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Pop'
      sleep 2
      browser.div(:text, "Genres").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/artists?query=Pop") #this is the wrong search result returned. Expecting "napster.com/genre/g.115"
      sleep 2
      browser.div(:id, "home-logo").when_present.click
    end

    it "Listeners" do
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'maren'
      sleep 2
      browser.div(:class, "item-type-icon icon-fans").when_present.click
      sleep 2
      expect(browser.url).to include ("lifestore-flat.at/search/artists?query=maren") #this is the wrong search result returned. Expecting "napster.com/members/maren"
    end
=end

  end
end
end
