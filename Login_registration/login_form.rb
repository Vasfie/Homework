require 'test/unit'
require 'selenium-webdriver'

class TestLogin < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_userlogin
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'login').click
    @wait.until{@browser.find_element(:id, 'username').displayed?}
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    @wait.until{@browser.find_element(:id, 'loggedas').displayed?}
    @browser.find_element(:class, 'logout').click
    @wait.until{@browser.find_element(:id, 'login').displayed?}
    assert(@browser.find_element(:id, 'registration').displayed?)
  end

  def teardown
    @browser.quit
  end
end