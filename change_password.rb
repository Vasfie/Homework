require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'


class TestChangePassword < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_positive
    login
    @browser.find_element(:class, 'my-account').click
    @wait.until{@browser.find_element(:class, 'icon-passwd').displayed?}
    @browser.find_element(:class, 'icon-passwd').click
    @wait.until{@browser.find_element(:id, 'password').displayed?}
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:id, 'new_password').send_keys '1234567'
    @browser.find_element(:id, 'new_password_confirmation').send_keys '1234567'
    @browser.find_element(:name, 'commit').click
    assert(@browser.find_element(:id, 'flash_notice').displayed?)

  end

  def teardown
    @browser.quit
  end
end
