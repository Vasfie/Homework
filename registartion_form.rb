require 'test/unit'
require 'selenium-webdriver'


class TestRegistration < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
  end

  def test_registration_page
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'register').click
    @wait.until{@browser.find_element(:id, 'user_login').displayed?}
    login = ('login' + rand(100).to_s)
    @browser.find_element(:id, 'user_login').send_keys login
    @browser.find_element(:id, 'user_password').send_keys '1234567asd'
    @browser.find_element(:id, 'user_password_confirmation').send_keys '1234567asd'
    @browser.find_element(:id, 'user_firstname').send_keys 'New'
    @browser.find_element(:id, 'user_lastname').send_keys 'user'
    @browser.find_element(:id, 'user_mail').send_keys (login + '@gmail.com')
    @browser.find_element(:name, 'commit').click
    assert(@browser.find_element(:class, 'flash notice').displayed?)
  end

  def teardown
    @browser.quit
  end
end


