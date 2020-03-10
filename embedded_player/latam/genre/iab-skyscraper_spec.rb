
require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "LATAM" do
  include_context "firefox browser"
    describe "EMBEDDED PLAYER", :embedded do
      describe "- GENRE -" do
      
      describe "IAB Skyscraper Player" do
            it "logo" do
              browser.cookies.clear
              browser.goto RhapsodyUrl.get(:latam, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "logo-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to eq (RhapsodyUrl.get(:latam,'/'))
              browser.windows.last.close
            end
            it "sign in" do
              browser.iframe(:id, "iab-skyscraper-player").body(:class, " filter-supported").li(:class, "header-account").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "modals").div(:class, "account-dialog dialog show").button(:id, "sign-in-button").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "login-dialog dialog show").div(:class, "section").text_field(:id, "username").set("usbeta@rhapsody.lan")
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "login-dialog dialog show").text_field(:id, "password").set("rhap123")
              browser.iframe(:id, "iab-skyscraper-player").button(:id => "login-button").when_present.click
              browser.cookies.clear
            end
            it "playback" do
              sleep 2
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-play").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-pause").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-previous").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:id, "player-controls").a(:id, "player-next").when_present.click
            end
            it "share" do
              browser.goto RhapsodyUrl.get(:latam, '/embedded-player/viewer.html')
              browser.div(:id, "content-types").radio(:value => 'genre').set
              browser.iframe(:id, "iab-skyscraper-player").li(:class, "header-share").when_present.click
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "social-services").a(:id, "facebook-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://www.facebook.com/")
              browser.windows.last.close
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "social-services").a(:id, "twitter-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://twitter.com")
              browser.windows.last.close
              browser.iframe(:id, "iab-skyscraper-player").div(:class, "social-services").a(:id, "googleplus-icon").when_present.click
              browser.windows.last.use
              expect(browser.url).to include ("https://accounts.google.com/ServiceLogin")
              browser.windows.last.close
            end
         end
       end
     end
  end
end