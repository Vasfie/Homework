require 'test-unit'
require 'selenium-webdriver'

class TestProjectCreate < Test::Unit::TestCase

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
    @wait.until{@browser.find_element(:class, 'my-account').displayed?}
    assert('Logged in as')
    @browser.find_element(:class, 'projects').click
    assert_equal('http://demo.redmine.org/projects', @browser.current_url)
    test_project
  end

  def test_project
    project_name = ('Test project' + rand(100).to_s)
    @browser.find_element(:xpath, "//div[@id='content']/div/a").click
    @wait.until{@browser.find_element(:id, "project_name")}
    @browser.find_element(:xpath, "//input[@id='project_name']").send_keys (project_name + 'new')
    @browser.find_element(:xpath, "//textarea[@id='project_description']").send_keys 'Lorem ipsum'
    @browser.find_element(:name, 'continue').click
    assert('Successful creation.')
  end
end


