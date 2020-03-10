require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "UK" do
  include_context "firefox browser"

    describe "ADD TO MIXER", :mixer do
    
      context "Add ALBUM to mixer" do
      it "Album added" do
      browser.goto RhapsodyUrl.get(:app,)
#      browser.a(:class, "button hide_for_mobile").when_present.click
      sleep 5
      browser.text_field(:id, "username").when_present.set("ukbeta@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
            sleep 15
            browser.div(:class, "nav-item nav-settings").when_present.click
            browser.ul(:class, "content-tabbed-nav").a(:text, "Player").when_present.click
            sleep 2
            browser.div(text: "Warn me before clearing out my queue").click
            sleep 5
            browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'V Maroon'
            sleep 2
            browser.div(:text, "V").when_present.click
            sleep 2
            browser.div(:class, "options-button icon-details_bold").when_present.click
            sleep 2
            browser.span(:class => "icon-mixer_open icon").when_present.click
            sleep 2
            browser.a(:href => "/genre/pop").when_present.click
            sleep 2
            end
            
            it "Album tracks exist in mixer" do
              browser.div(:class, "right-sidebar-items")
              browser.div(:class, "sidebar-mixer")
              browser.div(:class, "sidebar-scroll")
              sleep 2
            expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.56348/album/alb.187042426/track/tra.187042427")).to exist
            expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.56348/album/alb.187042426/track/tra.187042428")).to exist
            expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.56348/album/alb.187042426/track/tra.187042429")).to exist
            sleep 2
          end
            
            it "Clear mixer" do
              browser.div(:id, "sidebar-clear").when_present.click
            sleep 1
            browser.div(:class, "confirmation-ok").when_present.click
            sleep 2
            end
         end
          
              context "Add TRACK to mixer", :mixer do
                it "Track added to mixer" do
                  browser.goto RhapsodyUrl.get(:app)
                  sleep 10
                  browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'hello'
                  sleep 8
   #               browser.a(:href => "/artist/art.20554979/album/alb.203775827/track/tra.203775828").when_present.click
                  browser.div(:text, "Hello").when_present.click
                  sleep 3
                  browser.div(:class, "options-button icon-details_bold").when_present.click
      #            browser.div(:class, "track-info").when_present.click #fire_event 'mouseover'
      #            sleep 3
      #            browser.div(:class, "icon-add_to_playlist add-to-sidebar-button").when_present.click
                  sleep 2
                  browser.span(:class => "icon-mixer_open icon").when_present.click
                  sleep 2
   #               browser.a(:href => "/genre/pop").when_present.click
   #               sleep 2
                end
                
                it "Track exists in mixer" do
                  browser.div(:class, "right-sidebar-items")
                  browser.div(:class, "sidebar-mixer")
                  browser.div(:class, "sidebar-scroll")
                  sleep 1
                  expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.20554979/album/alb.203756365/track/tra.203756366")).to exist
                  sleep 2
                end
                
                it "Clear mixer" do
                  browser.div(:id, "sidebar-clear").when_present.click
                  sleep 1
                  browser.div(:class, "confirmation-ok").when_present.click
                  sleep 2
                end
              end
          
          
          context "Add LIBRARY to mixer" do
            it "Playlist added to mixer" do
              browser.goto RhapsodyUrl.get(:app,)
              sleep 10
              browser.div(:class, "nav-item nav-library").when_present.click
              sleep 3
              browser.div(:class, "options-button icon-details_bold").when_present.click
              sleep 2
              browser.span(:class => "icon-mixer_open icon").when_present.click
              sleep 2
            end
          
          it "Library tracks exist in mixer" do
              browser.div(:class, "right-sidebar-items")
              browser.div(:class, "sidebar-mixer")
              browser.div(:class, "sidebar-scroll")
            expect(browser.div(:class, "track-info")).to exist
      #      expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/Art.44043/album/Alb.131247944/track/Tra.131247960")).to exist
            sleep 2
          end
          
          it "Clear mixer" do
              browser.div(:id, "sidebar-clear").when_present.click
            sleep 1
            browser.div(:class, "confirmation-ok").when_present.click
            sleep 2
            end
         end
        end
      end
      end
