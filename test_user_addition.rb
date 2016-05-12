require 'test-unit'
require 'selenium-webdriver'

class TestUserAddition < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_positive
    @browser.navigate.to 'http://demo.redmine.org/projects/test-project77new'
    @browser.find_element(:class, 'login').click
    @wait.until{@browser.find_element(:id, 'username').displayed?}
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:id, 'tab-members').click
    @browser.find_element(:xpath, "//div[@id='tab-content-members']/p/a").click
    assert('Search for user or group:')
    test_useraddition
  end

  def test_useraddition
    #@browser.find_element(:class, 'autocomplete').send_keys 'andrew'
    #@wait.until{@message.('Andrew Rayner').displayed?}
    @browser.find_element(:xpath, "//div[@id='principals']/label[6]/input").click
    @browser.find_element(:xpath, "//div[@id='principals']/label[51]").click
    @browser.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[5]").click
    @browser.find_element(:id, 'member-add-submit').click
    assert("New member")
    test_user_edit
  end

  def test_user_edit
    @browser.find_element(:xpath, "(//a[contains(text(),'Edit')])[2]").click
    @browser.find_element(:xpath, "//form[@id='member-144898-roles-form']/p/label[2]/input").click
    @browser.find_element(:name,"commit").click
  end
end


