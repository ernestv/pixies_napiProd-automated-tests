require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "US" do
  include_context "firefox browser"

    describe "ADD TO MIXER", :mixer do
    
      context "Add ALBUM to mixer" do
      it "Album V added" do
      browser.goto RhapsodyUrl.get(:app,)
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 5
      browser.text_field(:id, "username").when_present.set("usbeta@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
      sleep 10
      browser.div(:class, "replay-carousel ember-view").div(:class, "play-button icon-play-button").when_present.click
#      browser.div(:class, "nav-item nav-playlists").when_present.click
#      sleep 1
#      browser.div(:class, "list").div(:class, "playlists-list-item  public").div(:class, "playlist-info").div(:class, "name").click
#      browser.div(:class, "play-button icon-play-button").when_present.click
      sleep 3
      browser.close
      end
      end
      end
  end
end

#browser.div(:class => "column album-item js-album-item").fire_event 'mouseover'