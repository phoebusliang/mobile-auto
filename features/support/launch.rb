require 'cucumber'
require 'selenium-webdriver'
require 'appium_lib'
wait = Selenium::WebDriver::Wait.new(:timeout => 50)


Before do |scenario|
  ios_safari = {
      'appium-version' => '1.5.3',
      'platformName' => 'iOS',
      'platformVersion' => '9.3',
      'deviceName' => 'iPhone 6 Plus',
      'browserName' => 'safari'

  }
  android_chrome = {
      'appium-version' => '1.5.3',
      'platformName' => 'android',
      'browserName' => 'Browser',
      'deviceName' => 'Samsung Galaxy S6'
  }

  ios_simulator = {
      'appium-version' => '1.5.3',
      'platformName' => 'iOS',
      'platformVersion' => '9.3',
      'deviceName' => 'iPhone 6 Plus',
      'app' => '/Users/twe/Documents/workspace/xcode/sample-code-master/sample-code/apps/TestApp/build/Products/Debug-iphonesimulator/TestApp.app'
      # 'app' => '/Users/twe/Library/Developer/Xcode/DerivedData/StudentReader-dqruzbelwcdxhfdueboddypryruz/Build/Products/Debug-iphonesimulator/GSStudent.app',
      # 'app' => '/Users/hedgebeijing/Documents/workspace/xcode/grapeleaf-student/Build/Products/Debug-iphonesimulator/GSStudent.app',
      # 'app' => '/Users/twe/Documents/workspace/xcode/sample-code-master/sample-code/apps/TestApp/build/Products/Debug-iphonesimulator/TestApp.app',
      # 'remote' => true,
  }

  android_simulator = {
      'appium-version' => '1.5.3',
      'platformName' => 'android',
      'deviceName' => 'Samsung Galaxy S6',
      'app' => '/Users/twe/Documents/workspace/xcode/sample-code-master/sample-code/apps/selendroid-test-app.apk'
  }

  case ENV['DRIVER']
    when 'android_chrome'
      @driver = Appium::Driver.new(caps: android_chrome).start_driver
    when 'ios_safari'
      @driver = Appium::Driver.new(caps: ios_safari).start_driver
    when 'ios_simulator'
      @driver = Appium::Driver.new(caps: ios_simulator).start_driver
    when 'android_simulator'
      @driver = Appium::Driver.new(caps: android_simulator).start_driver
  end
  # @appium = Appium::Driver.new(caps: capabilities, appium_lib: {server_url: 'http://10.29.3.7:4444/wd/hub'}).start_driver
  # @driver = Appium::Driver.new(caps: capabilities).start_driver
  # @appium = Selenium::WebDriver.for.new(caps: capabilities).start_driver
  # @driver = Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => "http://10.18.2.119:4444/wd/hub")
  Appium.promote_appium_methods Object
  wait { @driver.get "http://www.baidu.com" }
end

After do |scenario|
  @driver.manage.delete_all_cookies
  driver_quit
end

