
require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "EU" do
  include_context "firefox browser"
  
    context "CHANGE LANGUAGE" do
      it "French" do
        browser.goto RhapsodyUrl.get(:app,)
#        browser.a(:class, "button hide_for_mobile").when_present.click
        sleep 5
        browser.text_field(:id, "username").when_present.set("frbeta@rhapsody.lan")
        browser.text_field(:id, "password").when_present.set("rhap123")
        browser.button(:class, "signin").when_present.click
        sleep 15
        expect(browser.div(:class, "scroll-content main-scroll")).to exist
        browser.div(:class, "nav-item nav-settings").when_present.click
        browser.windows.last.use
        sleep 4
        expect(browser.url) .to include ("napster.com/settings/general")
        expect(browser.text).to include ("La musique que vous")
      end
      
      it "English" do
        browser.div(:class, "setting-item dropdown-container").div(:class, "setting-value").when_present.click
        browser.li(:text, "British English").when_present.click
        sleep 7
        expect(browser.text).to include ("Music you play will appear here")
      end
      
      it "Dansk" do
        browser.div(:class, "nav-item nav-settings").when_present.click
        browser.div(:class, "setting-item dropdown-container").div(:class, "setting-value").when_present.click
        browser.li(:text, "Dansk").when_present.click
        sleep 7
        expect(browser.text).to include ("Musik, du afspiller vises her i Mixeren")
      end
      
      it "Deutsch" do
        browser.div(:class, "nav-item nav-settings").when_present.click
        browser.div(:class, "setting-item dropdown-container").div(:class, "setting-value").when_present.click
        browser.li(:text, "Deutsch").when_present.click
        sleep 7
        expect(browser.text).to include ("Abgespielte Musik erscheint hier in der Wiedergabeliste")
      end
      
      it "Italiano" do
        browser.div(:class, "nav-item nav-settings").when_present.click
        browser.div(:class, "setting-item dropdown-container").div(:class, "setting-value").when_present.click
        browser.li(:text, "Italiano").when_present.click
        sleep 7
        expect(browser.text).to include ("La musica che riproduci viene visualizzata nel mixer")
      end
      
      it "Nederlands" do
        browser.div(:class, "nav-item nav-settings").when_present.click
        browser.div(:class, "setting-item dropdown-container").div(:class, "setting-value").when_present.click
        browser.li(:text, "Nederlands").when_present.click
        sleep 7
        expect(browser.text).to include ("De muziek die je afspeelt verschijnt hier in de Mixer")
      end
    end
  end
end