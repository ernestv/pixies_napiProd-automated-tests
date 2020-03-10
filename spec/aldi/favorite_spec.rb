require 'rspec'
#require 'selenium-webDriver'
require 'watir-webdriver'

describe "FAVORITES" do
  describe "ALDI" do
  include_context "firefox browser"

  describe "ADD TO FAVORITES", :favorites do

    context "From SEARCH to favorites" do
      it "Track added" do
        browser.goto RhapsodyUrl.get(:appal)
#        browser.link(:id, "overridelink").click
#      browser.a(:text, "Login").when_present.click
      sleep 5
      browser.text_field(:id, "username").when_present.set("aldipitch@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("qqqqqq")
      browser.button(:class, "signin").when_present.click
      sleep 15
        browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'hello'
        sleep 5
        browser.div(:text, "Hello").when_present.click
        sleep 3
        browser.div(:class, "track-info").when_present.hover
        browser.div(:class, "options-button icon-options").when_present.click
        sleep 1
        
        if 
          browser.div(:class, "options-menu-item add-to-favorites").span(:class => "icon-favorite_on icon").present?
          browser.div(:class, "options-menu-item add-to-favorites").span(:class => "icon-favorite_on icon").when_present.click
        else
          browser.div(:class, "options-menu-item remove-from-favorites").span(:class => "icon-fav icon").when_present.click
          browser.div(:class, "track-info").when_present.hover
#          browser.div(:class, "track-info").fire_event 'mouseover'
          browser.div(:class, "options-button icon-options").when_present.click
          sleep 1
          browser.div(:class, "options-menu-item add-to-favorites").span(:class => "icon-favorite_on icon").when_present.click
        end
        
        sleep 3
        browser.div(:class, "nav-item nav-favorites").when_present.click
        sleep 4
        browser.a(:text, "Hello").hover
        sleep 2
        browser.div(:class, "icon-trash_can delete-button").when_present.click
        sleep 2
      end



      it "History" do
        browser.goto RhapsodyUrl.get(:appal)
        sleep 5
        browser.div(:class, "icon-listening_history").when_present.click
        sleep 5
        browser.div(:class, "track-info").when_present.hover #fire_event 'mouseover'
        sleep 3
        browser.div(:class, "options-button icon-options").when_present.click
        sleep 1
        
        if 
          browser.div(:class, "options-menu-item add-to-favorites").span(:class => "icon-favorite_on icon").present?
          browser.div(:class, "options-menu-item add-to-favorites").span(:class => "icon-favorite_on icon").when_present.click
        else
          browser.div(:class, "options-menu-item remove-from-favorites").span(:class => "icon-fav icon").when_present.click
          browser.div(:class, "track-info").when_present.hover #fire_event 'mouseover'
          browser.div(:class, "options-button icon-options").when_present.click
          sleep 1
          browser.div(:class, "options-menu-item add-to-favorites").span(:class => "icon-favorite_on icon").when_present.click
        end
        
        sleep 3
        browser.div(:class, "nav-item nav-favorites").when_present.click
        sleep 4
        browser.div(:class, "track-info").hover
        sleep 1
        browser.div(:class, "icon-trash_can delete-button").when_present.click
        sleep 2
      end
     end    
  end
end
end
