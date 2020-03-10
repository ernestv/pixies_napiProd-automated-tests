require 'rspec'
require 'watir-webdriver'

describe "SEARCH" do
  describe "EU" do
  include_context "firefox browser"

  context "SEARCH", :search do
    it "Artist" do
      
      browser.goto RhapsodyUrl.get(:app,)
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 5
      browser.text_field(:id, "username").when_present.set("frbeta@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
      sleep 15
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
      
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-artist2").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/artists?query=Maroon")
#      browser.div(:text, "Artistes").when_present.click
#      browser.div(:id, "home-logo").when_present.click
    end

    it "Tracks" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 1
      browser.div(:class, "item-type-icon icon-track").when_present.click
      sleep 1
      expect(browser.url).to include ("napster.com/search/tracks?query=Maroon")
#      browser.div(:text, "Morceaux").when_present.click

    end

    it "Albums" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 1
      browser.div(:class, "item-type-icon icon-album").when_present.click
      sleep 1
      expect(browser.url).to include ("napster.com/search/albums?query=Maroon")
#      browser.div(:text, "Albums").when_present.click
      browser.div(:id, "home-logo").when_present.click
    end

    it "Featured" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 1
      browser.div(:class, "item-type-icon icon-playlists").when_present.click
#      browser.div(:text, "Playlists ˆ la une").when_present.click
      sleep 1
      expect(browser.url).to include ("napster.com/search/playlists/featured?query=Maroon")
      browser.div(:id, "home-logo").when_present.click
    end

    it "Listener Playlists" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 1
      browser.div(:text, "Playlists de l'utilisateur").when_present.click
      sleep 1
      expect(browser.url).to include ("napster.com/search/playlists/listeners?query=Maroon")
#      browser.div(:id, "home-logo").when_present.click
    end

=begin
    it "Genres" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Pop'
      sleep 1
      browser.div(:class, "item-type-icon icon-genre_02").when_present.click
      sleep 1
      expect(browser.url).to include ("Pop")
      browser.div(:id, "home-logo").when_present.click
    end

    it "Listeners" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'maren'
      sleep 1
      browser.div(:class, "item-type-icon icon-fans").when_present.click
      sleep 1
      expect(browser.url).to include ("maren")
    end
=end    
  end
  end
  end