require 'test-unit'
require 'selenium-webdriver'

class TestNewVersion < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_positive
    @browser.navigate.to 'http://demo.redmine.org/projects/test-project53new'
    @browser.find_element(:class, 'login').click
    @wait.until{@browser.find_element(:id, 'username').displayed?}
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:css, "#tab-versions").click
    @browser.find_element(:xpath, "//a[contains(text(),'New version')]").click
    assert ('New version')
    test_new_version
  end

  def test_new_version
    @browser.find_element(:xpath, "//input[@id='version_name']").send_keys 'Version1'
    @browser.find_element(:name, 'commit').click
  end
end

