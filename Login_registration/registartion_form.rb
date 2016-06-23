require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'


class TestRegistration < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 20)
  end

  def test_positive
    register_user
  end

  def teardown
    @browser.quit
  end
end


