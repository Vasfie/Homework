require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'

class TestNewVersion < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_positive
   login
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "project_quick_jump_box"))
    @select.select_by(:text, "Test project12new")
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:css, "#tab-versions").click
    @browser.find_element(:xpath, "//div[5]/p[2]/a").click
    @wait.until{@browser.find_element(:css, "#version_name").displayed?}
    @browser.find_element(:css, "#version_name").send_keys 'Version2'
    @browser.find_element(:name, 'commit').click
    assert(@browser.find_element(:id, 'flash_notice').displayed?)
  end

end

