require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "EU" do
  include_context "firefox browser"

=begin    it "Signin" do
      browser.goto RhapsodyUrl.get(:eu,)
      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 10
      browser.text_field(:id, "username").when_present.set("qa_cjrz9h@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
      sleep 15
 #     expect(browser.div(:class, "scroll-content main-scroll")).to exist
=end
    
    describe "SHARE", :share do
      it "Twitter" do
      
        browser.goto RhapsodyUrl.get(:app,)
#        browser.a(:class, "button hide_for_mobile").when_present.click
        sleep 5
        browser.text_field(:id, "username").when_present.set("frbeta@rhapsody.lan")
        browser.text_field(:id, "password").when_present.set("rhap123")
        browser.button(:class, "signin").when_present.click
        sleep 15
      
      
        browser.div(:class, "nav-profile").when_present.click
        browser.div(:class, "share-icon icon-twitter").when_present.click
        browser.windows.last.use
        sleep 1
        expect(browser.url).to include ("twitter.com/intent/tweet?")
        browser.windows.last.close
      end

      it "FB" do
        browser.div(:class, "nav-profile").when_present.click
        browser.div(:class, "share-icon icon-facebook").when_present.click
        browser.windows.last.use
        sleep 1
        expect(browser.url).to include ("facebook.com/login.php")
        browser.windows.last.close
      end

      it "Link" do
        browser.div(:class, "share-icon icon-link").when_present.click
        sleep 1
        expect(browser.div(:class, "confirmation-container")) .to exist
        browser.div(:class, "confirmation-ok").when_present.click
      end
     end
    end
    end