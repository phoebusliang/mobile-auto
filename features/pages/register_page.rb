require 'appium_lib'
require 'selenium-webdriver'

class Register_page
  def initialize(driver)
    @driver = driver
  end

  def tap_register_btn
    find_element(:name, "Register").click
  end

  def get_url url
    # wait.until { @driver.get url }
  end
end