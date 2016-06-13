require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'

class TestProjectCreate < Test::Unit::TestCase
  include ProjectHelper


  def setup
    setup_browser
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_login
    @browser.navigate.to 'http://demo.redmine.or g'
    @browser.find_element(:class, 'login').click
    @wait.until{@browser.find_element(:id, 'username').displayed?}
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    @wait.until{@browser.find_element(:class, 'my-account').displayed?}
    @browser.find_element(:class, 'projects').click
    assert('http://demo.redmine.org/projects', @browser.current_url)
    create_project
  end

  def test_positive
    my_variable = rand(100).to_s
    @browser.navigate.to(:title, "Test project#{my_variable}new")

    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "project_quick_jump_box"))
    @select.select_by(:text, "Test project#{my_variable}new")
  end
end


