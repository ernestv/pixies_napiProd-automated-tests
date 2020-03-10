require 'rspec'
require 'watir-webdriver'
require 'rubygems'
require 'selenium-webdriver'

# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps['browser'] = 'IE'
caps['browser_version'] = '11.0'
caps['os'] = 'Windows'
caps['os_version'] = '10'
caps['resolution'] = '1024x768'


driver = Selenium::WebDriver.for(:remote,
  :url => "http://fiveagency1:BU3x48PrCxthoycqxYyK@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)
driver.navigate.to "us.napster.com"
element = driver.find_element(:id, 'username')
element = driver.find_element(:password, 'rhap123')
element = driver.find_element(:signin, 'rhap123')
#element.send_keys "BrowserStack"
#element.submit
browser.text_field(:id, "username").when_present.set("usbeta@rhapsody.lan")
      browser.text_field(:id, "password").when_present.set("rhap123")
      browser.button(:class, "signin").when_present.click
puts driver.title
driver.quit