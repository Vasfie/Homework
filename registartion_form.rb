require 'test-unit'
require 'selenium-webdriver'


class TestRegistration < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_registration_page
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'register').click
    assert_equal('http://demo.redmine.org/account/register', @browser.current_url)
    @browser.find_element(:id, 'user_login').send_keys 'UserUser'
    @browser.find_element(:id, 'user_password').send_keys '1234567asd'
    @browser.find_element(:id, 'user_password_confirmation').send_keys '1234567asd'
    @browser.find_element(:id, 'user_firstname').send_keys 'New'
    @browser.find_element(:id, 'user_lastname').send_keys 'user'
    @browser.find_element(:id, 'user_mail').send_keys "newuser1@gmail.com"
    @browser.find_element(:name, 'commit').click
    assert_equal ('Your account has been activated. You can now log in.')
  end

  def teardown
    @browser.quit
  end
end


