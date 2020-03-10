require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "UK" do
  include_context "firefox browser"

    it "PROFILE" do
        browser.goto RhapsodyUrl.get(:app,)
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 10
      browser.text_field(:id, "username").when_present.set("ukbeta@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
      sleep 15
        sleep 2
        browser.div(:class, "nav-profile").when_present.click
        sleep 2
  browser.div(:id, "home-logo").click
  sleep 3
  end
  end
  end