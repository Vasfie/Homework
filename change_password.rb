require 'test-unit'
require 'selenium-webdriver'


class TestChangePassword < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  end

  def test_positive
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'login').click
    assert_equal('http://demo.redmine.org/login', @browser.current_url)
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    @wait.until{@browser.find_element(:class, 'my-account').displayed?}
    @browser.find_element(:class, 'my-account').click
    @browser.find_element(:class, 'icon-passwd').click
    @wait.until{@browser.find_element(:id, 'password').displayed?}
    assert('Change Password')
    test_fill_fields
  end


  def test_fill_fields
  @browser.find_element(:id, 'password').send_keys '1234567asd'
  @browser.find_element(:id, 'new_password').send_keys '1234567'
  @browser.find_element(:id, 'new_password_confirmation').send_keys '1234567'
  @browser.find_element(:name, 'commit')
  end
end
