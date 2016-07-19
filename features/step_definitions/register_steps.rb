require 'appium_lib'
require 'selenium-webdriver'

When /^I tap register button$/ do | |
  Register_page.new(@driver).tap_register_btn
end

When /^Open "(.*?)"$/ do |url|
  Register_page.new(@driver).get_url url
end