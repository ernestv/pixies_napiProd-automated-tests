shared_context "firefox browser" do
  let(:browser){ @browser }
  before(:all) {
    Selenium::WebDriver::Firefox.path = "/Applications/Firefox7.app/Contents/MacOS/firefox"
    @browser = Watir::Browser.new :firefox
    @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
#  after(:each) { |example|
#    @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
#  }
  after(:all) { @browser.close }
end

shared_context "firefox browser for each example" do
  let(:browser){ @browser }
  before(:each) {
    Selenium::WebDriver::Firefox.path = "/Applications/Firefox7.app/Contents/MacOS/firefox"
      @browser = Watir::Browser.new :firefox
      @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
  
 after(:each) { |example|
#   @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
   @browser.close
 }
end



shared_context "chrome browser" do
  let(:browser){ @browser }
  before(:all) {
    Selenium::WebDriver::Chrome.path = "/Applications/Google\ Chrome\ 75.app/Contents/MacOS/Google\ Chrome"
#    @browser = Watir::Browser.new :chrome
    @browser = Watir::Browser.new :chrome, switches: ['--incognito']
#    target_size = Selenium::WebDriver::Dimension.new(1024, 768)
#    @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
#    @browser.driver.manage.window.maximize
  }
# after(:each) { |example|
#    @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
#  }
  after(:all) { @browser.close }


shared_context "chrome browser for each example" do
  let(:browser){ @browser }
  before(:each) {
    Selenium::WebDriver::Firefox.path = "/Applications/Google\ Chrome\ 75.app/Contents/MacOS/Google\ Chrome"
#    @browser = Watir::Browser.new :chrome
    @browser = Watir::Browser.new :chrome, switches: ['--incognito']
#    target_size = Selenium::WebDriver::Dimension.new(1024, 768)
#    @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
#    @browser.driver.manage.window.maximize
  }
  
 after(:each) { |example|
#   @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
   @browser.close
 }
end



shared_context "safari browser" do
  let(:browser){ @browser }
  before(:each) {
    Selenium::WebDriver::Firefox.path = "/Applications/Safari.app/Contents/MacOS/Safari"
      @browser = Watir::Browser.new :safari
      @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
# after(:each) { |example|
#    @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
#  }
  after(:all) { @browser.close }
end

shared_context "safari browser for each example" do
  let(:browser){ @browser }
  before(:each) {
    Selenium::WebDriver::Firefox.path = "/Applications/Safari.app/Contents/MacOS/Safari"
      @browser = Watir::Browser.new :safari
      @browser.window.resize_to(RSpec.configuration.browser_size[:width], RSpec.configuration.browser_size[:height])
  }
  
 after(:each) { |example|
#   @browser.screenshot.save File.join(RSpec.configuration.output_dir, "#{example.full_description.gsub(/[^\w\.]/, '_')}.png")
   @browser.close
 }
end

end
