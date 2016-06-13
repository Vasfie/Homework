require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'

class TestCreateIssue < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_positive
    login
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "project_quick_jump_box"))
    @select.select_by(:text, "Test project12new")
    @browser.find_element(:css, "a.new-issue").click
    @browser.find_element(:id, "issue_subject").send_keys 'Summary1'
    @browser.find_element(:name, "continue").click
    @browser.find_element(:css, "#issue_tracker_id").click
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:css, "#issue_tracker_id"))
    @select.select_by(:text, "Feature")
    @browser.find_element(:css, "a.new-issue").click
    @browser.find_element(:id, "issue_subject").send_keys 'Test feature'
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id"))
    @select.select_by(:text, "High")
    @browser.find_element(:name, "continue").click
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:css, "#issue_tracker_id"))
    @select.select_by(:text, "Support")
    @browser.find_element(:id, "issue_subject").send_keys 'New support item'
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_status_id"))
    @select.select_by(:text, "In Progress")
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id"))
    @select.select_by(:text, "Urgent")
    @browser.find_element(:name, "continue").click
    assert(@browser.find_element(:id, 'flash_notice').displayed?)
  end

end
