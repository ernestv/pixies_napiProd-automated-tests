require 'rspec'
require 'watir-webdriver'

describe "WEBCLIENT" do
  describe "ALDI" do
  include_context "firefox browser"
  
    describe "ADD TO MIXER", :mixer do
    
      context "Add ALBUM to mixer" do
          it "Album Memories added" do
            browser.goto RhapsodyUrl.get(:appal)
#            browser.a(:text, "Login").when_present.click
            sleep 10
            browser.text_field(:id, "username").when_present.set("aldipitch@rhapsody.lan")
            browser.text_field(:id, "password").when_present.set("qqqqqq")
            browser.button(:class, "signin").when_present.click
      sleep 15
      browser.div(:class, "nav-item nav-settings").when_present.click
      browser.ul(:class, "content-tabbed-nav").a(:text, "Player").when_present.click
      sleep 4
      browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar active ember-view").when_present.click
      sleep 2
      browser.div(:text, "Ich möchte vor dem Zurücksetzen meiner Wiedergabeliste benachrichtigt werden").when_present.click
      sleep 5
      browser.div(:class, "right-sidebar-toggle-view-button icon-sidebar ember-view").when_present.click
      sleep 2
      browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'Maroon'
      sleep 2
      browser.div(:text, "Memories").when_present.click
      sleep 2
      browser.div(:class, "track-info").when_present.hover #fire_event 'mouseover'
      sleep 2
      browser.div(:class, "options-button icon-options").when_present.click
      browser.span(:class => "icon-mixer_open icon").when_present.click
 #     sleep 2
 #     browser.a(:href => "/genre/pop").when_present.click
      sleep 2
      end
          
          it "Album tracks exist in mixer" do
            browser.div(:class, "right-sidebar-items")
            browser.div(:class, "sidebar-mixer")
            browser.div(:class, "sidebar-scroll")
            sleep 1
            expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.56348/album/alb.408277544/track/tra.408277546")).to exist
#            expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.56348/album/alb.62260596/track/tra.62260598")).to exist
#            expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.56348/album/alb.62260596/track/tra.62260599")).to exist
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
            browser.goto RhapsodyUrl.get(:appal,)
            sleep 10
            browser.text_field(:class, 'mousetrap-search ember-text-field ember-view').set 'hello'
            sleep 8
            browser.a(:href => "/artist/art.20554979/album/alb.203756365").when_present.click
#            browser.div(:text, "Hello").when_present.click
            sleep 3
            browser.div(:class, "options-button icon-details_bold").when_present.click
#            browser.div(:class, "track-info").when_present.click #fire_event 'mouseover'
#            sleep 3
#            browser.div(:class, "icon-add_to_playlist add-to-sidebar-button").when_present.click
            sleep 2
            browser.span(:class => "icon-mixer_open icon").when_present.click
            sleep 2
            browser.a(:href => "/genre/pop").when_present.click
            sleep 2
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
        
        
=begin        context "Add PLAYLIST to mixer" do
          it "Playlist added to mixer" do
            browser.goto RhapsodyUrl.get(:appal,)
            sleep 10
            browser.div(:class, "nav-item nav-playlists").when_present.click
            sleep 2
#            browser.div(:class, "filter-option mine").when_present.click
#            sleep 2
            browser.div(:class, "playlist-info").when_present.click
            sleep 2
#            browser.div(:class, "ember-view track-list-header delete-mode").div(:class, "options-button icon-details_bold").when_present.click
            browser.div(:class, "options-button icon-details_bold").when_present.click
            sleep 2
            browser.span(:class => "icon-mixer_open icon").when_present.click
            sleep 3
          end 
    
    it "Playlist tracks exist in mixer" do
        browser.div(:class, "right-sidebar-items")
        browser.div(:class, "sidebar-mixer")
        browser.div(:class, "sidebar-scroll")
        sleep 2
#      expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/Art.23613909/album/Alb.232127543/track/Tra.232127558")).to exist #Lady
#      expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/Art.23613909/album/Alb.138747915/track/Tra.138747919")).to exist #Ideja
      expect(browser.div(:class, "sidebar-scroll").div(:class, "track-info")).to exist
      sleep 2
    end
    
    it "Clear mixer" do
        browser.div(:id, "sidebar-clear").when_present.click
      sleep 1
      browser.div(:class, "confirmation-ok").when_present.click
      sleep 2
      end
   end  
=end        
        
        context "Add LIBRARY to mixer" do
          it "Library added to mixer" do
          browser.goto RhapsodyUrl.get(:al,)
          sleep 10
          browser.div(:class, "nav-item nav-library").when_present.click
          sleep 2
          browser.div(:class, "options-button icon-details_bold").when_present.click
          sleep 2
          browser.span(:class => "icon-mixer_open icon").when_present.click
          sleep 2
        end
        
        it "Library tracks exist in mixer" do
          browser.div(:class, "right-sidebar-items")
          browser.div(:class, "sidebar-mixer")
          browser.div(:class, "sidebar-scroll")
          sleep 1
          expect(browser.div(:class, "sidebar-scroll").a(:href => "/artist/art.5060/album/alb.177820596/track/tra.177820611")).to exist
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
