require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "VIVO" do
  include_context "firefox browser"

  context "SEARCH", :search do
    it "Artist" do
        browser.goto RhapsodyUrl.get(:appvivo)
        sleep 10
        browser.text_field(:id, "username").when_present.set("5511111111199")
        browser.text_field(:id, "password").when_present.set("111199")
        browser.button(:text, "Login").click
        sleep 15
        browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
        sleep 2
        browser.div(:class, "item-type-icon icon-artist2").when_present.click
        sleep 2
        expect(browser.url).to include ("napster.com/search/artists?query=Maroon")
    end

    it "Tracks" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-track").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/tracks?query=Maroon")
    end

    it "Albums" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:class, "item-type-icon icon-album").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/albums?query=Maroon")
    end

    it "Featured" do
      browser.div(:id, "home-logo").when_present.click
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:text, "Playlists em destaque").when_present.click
      sleep 2
      expect(browser.url).to include ("napster.com/search/playlists/featured?query=Maroon")
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