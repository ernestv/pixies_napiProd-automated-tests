require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "CA" do
  include_context "firefox browser"

  context "SEARCH", :search do
    it "Artist" do
      browser.goto RhapsodyUrl.get(:app,)
#      browser.nav(:class, "right").link(:id, "nav-signin").when_present.click
#      expect(browser.url) .to include ("napster.com/login")
      sleep 5
      browser.text_field(:id, "username").when_present.set("qatestCA5@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("qwerty")
      browser.button(:class, "signin").when_present.click
      sleep 10
      expect(browser.div(:class, "scroll-content main-scroll")).to exist
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-artist2").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/artists?query=Maroon")
      browser.div(:text, "Artists").when_present.click
    end

    it "Tracks" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-track").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/tracks?query=Maroon")
      browser.div(:text, "Tracks").when_present.click
    end

    it "Albums" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-album").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/albums?query=Maroon")
      browser.div(:text, "Albums").when_present.click
#      browser.div(:class, "logo icon-napster-logo").when_present.click
    end

    it "Featured" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 3
      browser.a(:href => "/search/playlists/featured?query=Maroon").when_present.click
#      browser.div(:class, "item-type-icon icon-playlists").a(:text, "Featured Playlists").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/playlists/featured?query=Maroon")
      sleep 3
 #     browser.div(:class, "logo icon-napster-logo").when_present.click
    end

    it "Listener Playlists" do
      browser.div(:id, "home-logo").when_present.click
      sleep 2
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 3
      browser.a(:href => "/search/playlists/listeners?query=Maroon").when_present.click
#      browser.a(:text, "Listener Playlists").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/playlists/listeners?query=Maroon")
#      browser.div(:class, "logo icon-napster-logo").when_present.click
    end

=begin
    it "Genres" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Pop'
      sleep 2
      browser.div(:text, "Genres").when_present.click
      sleep 2
      expect(browser.url).to include ("Pop")
    end

    it "Listeners" do
      browser.div(:id, "home-logo").when_present.click
      sleep 1
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'maren'
      sleep 2
      browser.div(:text, "Listeners").when_present.click
      sleep 2
      expect(browser.url).to include ("maren")
    end
=end
    end
    end
  end