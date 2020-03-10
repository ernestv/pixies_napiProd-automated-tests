require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "ALDI" do
  include_context "firefox browser"
  
    describe "ADD TO MIXER", :mixer do
    
      context "Add ALBUM to mixer" do
          it "Album OVEREXPOSED added" do
            browser.goto RhapsodyUrl.get(:appal)
#            browser.a(:text, "Login").when_present.click
            sleep 5
            browser.text_field(:id, "username").when_present.set("aldipitch@rhapsody.lan")
            browser.text_field(:id, "password").when_present.set("qqqqqq")
            browser.button(:class, "signin").when_present.click
      sleep 10
      browser.div(:class, "nav-item nav-settings").when_present.click
      browser.ul(:class, "content-tabbed-nav").a(:text, "Player").when_present.click
      sleep 4
       browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar active ember-view").when_present.click
#      browser.div(:id, "ember1185").when_present.click
      sleep 2
      browser.div(:text, "Ich möchte vor dem Zurücksetzen meiner Wiedergabeliste benachrichtigt werden").when_present.click
      sleep 5
      end
    end
  end
  end
end