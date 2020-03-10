require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
describe "US" do
include_context "firefox browser"

  describe "SETTINGS" do
  
    context "General" do
      it "content" do
        browser.goto RhapsodyUrl.get(:app,)
#        browser.nav(:class, "right").link(:id, "nav-signin").when_present.click
#        expect(browser.url) .to include ("napster.com/login")
        sleep 5
        browser.text_field(:id, "username").when_present.set("usbeta@rhapsody.lan")
        browser.text_field(:id, "password").when_present.set("rhap123")
        browser.button(:class, "signin").when_present.click
        sleep 10
        expect(browser.div(:class, "scroll-content main-scroll")).to exist
        
#        browser.goto RhapsodyUrl.get(:appus,)
#        sleep 10
        browser.div(:class, "nav-item nav-settings").when_present.click
        browser.windows.last.use
        sleep 4
        expect(browser.url) .to include ("napster.com/settings/general")
      end
      
      it "Account Info" do            
        expect(browser.div(:class, "settings-pages expand-content")).to exist
        expect(browser.div(:class, "setting-button-item")).to exist
        expect(browser.div(:class, "facebook-settings-button facebook-disconnected")).to exist
        expect(browser.div(:class, "amazon-settings-button amazon-disconnected")).to exist
        expect(browser.div(:class, "setting-value")).to exist
      end
      
      it "Resources" do
        expect(browser.div(:text, "Apps and Devices")).to exist
        expect(browser.div(:text, "Gift")).to exist
        expect(browser.div(:text, "Company Info")).to exist
        expect(browser.div(:text, "Blog")).to exist
        expect(browser.div(:text, "Customer Support")).to exist
#        expect(browser.a(:href, "http://us.napster.com/gift/buy")).to exist
#        expect(browser.a(:href, "http://us.napster.com/about")).to exist
#        expect(browser.a(:href, "http://blog.napster.com")).to exist
#        expect(browser.a(:href, "http://us.napster.com/support")).to exist

        sleep 10
        
#        browser.a(:href, "http://us.napster.com/gift/buy")).to exist
#        browser.a(:href, "http://us.napster.com/about")).to exist
#        browser.a(:href, "http://blog.napster.com")).to exist
#        browser.a(:href, "http://us.napster.com/support")).to exist 

      end
      
      it "Terms" do
        expect(browser.div(:text, "EULA")).to exist
        expect(browser.div(:text, "Terms of Use")).to exist
        expect(browser.div(:text, "Privacy Policy")).to exist
#        expect(browser.a(:href, "http://us.napster.com/eula")).to exist
#        expect(browser.a(:href, "http://us.napster.com/eula")).to exist
#        expect(browser.a(:href, "http://us.napster.com/eula")).to exist
      end
      
      it "Change language" do
        browser.div(:class, "setting-item dropdown-container").div(:class, "setting-value").when_present.click
        browser.li(:text, "English").when_present.click
      end    
        
      context "Player" do
        it "content" do
          browser.div(:class, "nav-item nav-settings").when_present.click
          browser.ul(:class, "content-tabbed-nav").a(:text, "Player").when_present.click
        end
        
        it "Playback" do
          expect(browser.div(:class, "slider-bar")).to exist
          expect(browser.div(:class, "setting-value")).to exist
          expect(browser.div(:class, "setting-title")).to exist
          expect(browser.input(:class, "ember-checkbox ember-view")).to exist
#          expect(browser.checkbox(:id, "ember2000")).to exist
        end
        
        it "Appearance" do
#          expect(browser.checkbox(:id, "ember2002")).to exist
          expect(browser.text) .to include ("Show dynamic player background")
        end
      end
      
      
      context "KIDS" do
        it "content" do
          browser.div(:class, "nav-item nav-settings").when_present.click
          browser.ul(:class, "content-tabbed-nav").a(:text, "KIDS").when_present.click
          expect(browser.div(:id, "kids-page")).to exist
          expect(browser.ul(:class, "subtabs header-content")).to exist
        end
      end
      
      context "Advanced" do
        it "content" do
          browser.div(:class, "nav-item nav-settings").when_present.click
          browser.ul(:class, "content-tabbed-nav").a(:text, "Advanced").when_present.click
          expect(browser.div(:class, "scroll-content main-scroll")).to exist
#          expect(browser.div(:class, "ember-view ember-checkbox")).to exist
          expect(browser.div(:class, "setting-container rhaplite-toggle")).to exist
          expect(browser.text).to include ("RhapLite")
          expect(browser.text).to include ("Debugging")
        end
      end           
    end
  end
end
end