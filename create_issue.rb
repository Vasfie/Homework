require 'test-unit'
require 'selenium-webdriver'

class TestCreateIssue < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_userlogin
    @browser.navigate.to 'http://demo.redmine.org/projects/test-project77new/'
    @browser.find_element(:class, 'login').click
    @wait.until{@browser.find_element(:id, 'username').displayed?}
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    test_create_issue
  end

  def test_create_issue
    @browser.find_element(:css, "a.new-issue").click
    @browser.find_element(:id, "issue_subject").send_keys 'Summary1'
    @browser.find_element(:name, "continue").click
    @browser.find_element(:css, "#issue_tracker_id").click
    test_create_feature
  end

  def test_create_feature
  @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:css, "#issue_tracker_id"))
  @select.select_by(:text, "Feature")
  @browser.find_element(:css, "a.new-issue").click
  @browser.find_element(:id, "issue_subject").send_keys 'Test feature'
  #@select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_status_id"))
  #@select.select_by(:text, "In Progress")
  @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id"))
  @select.select_by(:text, "High")
  @browser.find_element(:name, "continue").click
  test_create_support
  end

  def test_create_support
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:css, "#issue_tracker_id"))
    @select.select_by(:text, "Support")
    @browser.find_element(:id, "issue_subject").send_keys 'New support item'
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_status_id"))
    @select.select_by(:text, "In Progress")
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "issue_priority_id"))
    @select.select_by(:text, "Urgent")
    @browser.find_element(:name, "continue").click
  end
end
