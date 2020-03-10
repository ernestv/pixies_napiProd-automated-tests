require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "LATAM" do
  include_context "firefox browser"

  context "SEARCH", :search do
    it "Artist" do
      browser.goto RhapsodyUrl.get(:app)
#        browser.a(:id, "nav-signin").click
#       browser.a(:class, "button hide_for_mobile").when_present.click
#       sleep 10
        browser.text_field(:id, "username").when_present.set("brbeta@rhapsody.lan")
        browser.text_field(:id, "password").when_present.set("rhap123")
#       browser.a(:id, "nav-signin").a(:href => '/login').when_present.click
        browser.button(:text, "Log In").click
        sleep 15
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-artist2").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/artists?query=Maroon")
#      browser.div(:text, "Artists").when_present.click
      browser.div(:id, "home-logo").when_present.click
    end

    it "Tracks" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-track").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/tracks?query=Maroon")
#      browser.div(:text, "Tracks").when_present.click
      browser.div(:id, "home-logo").when_present.click
    end

    it "Albums" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-album").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/albums?query=Maroon")
#      browser.div(:text, "Albums").when_present.click
      browser.div(:id, "home-logo").when_present.click
    end

    it "Featured" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:text, "Playlists em destaque").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/playlists/featured?query=Maroon")
      browser.div(:id, "home-logo").when_present.click
    end

    it "Listener Playlists" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:text, "Playlists dos ouvintes").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/playlists/listeners?query=Maroon")
    end

=begin
    it "Genres" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Pop'
      sleep 2
      browser.div(:class, "item-type-icon icon-genre_02").when_present.click
      sleep 2
      expect(browser.url).to include ("Pop")
    end

    it "Listeners" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'maren'
      sleep 2
      browser.div(:text, "Ouvintes").when_present.click
      sleep 2
      expect(browser.url).to include ("maren")
    end
=end    
  end
  end
  end