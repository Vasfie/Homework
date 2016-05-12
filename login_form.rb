require 'test-unit'
require 'selenium-webdriver'

class TestLogin < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_userlogin
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'login').click
    assert_equal('http://demo.redmine.org/login', @browser.current_url)
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    assert('Logged in as')
    test_log_out
  end

  def test_log_out
    @browser.find_element(:class, 'logout').click
    @wait.until{@browser.find_element(:id, 'login').displayed?}
    assert('Register')
  end
end