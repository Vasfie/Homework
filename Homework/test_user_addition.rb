require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'

class TestUserAddition < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  #def test_positive
   #@browser.find_element(:class, 'register').click
   # @wait.until{@browser.find_element(:id, 'user_login').displayed?}
   # @browser.find_element(:id, 'user_login').send_keys 'NewUser1'
   # @browser.find_element(:id, 'user_password').send_keys '1234567'
   # @browser.find_element(:id, 'user_password_confirmation').send_keys '1234567'
   # @browser.find_element(:id, 'user_firstname').send_keys 'New'
   # @browser.find_element(:id, 'user_lastname').send_keys 'user'
   # @browser.find_element(:id, 'user_mail').send_keys 'user1@gmail.com'
   # @browser.find_element(:name, 'commit').click
   # @browser.find_element(:class, 'logout').click
   # @wait.until{@browser.find_element(:id, 'login').displayed?}
   # assert(@browser.find_element(:id, 'registration').displayed?)
  #end

  def test_run
    @browser.navigate.to 'http://demo.redmine.org'
    @browser.find_element(:class, 'login').click
    @wait.until{@browser.find_element(:id, 'username').displayed?}
    @browser.find_element(:id, 'username').send_keys 'UserUser'
    @browser.find_element(:id, 'password').send_keys '1234567asd'
    @browser.find_element(:name, 'login').click
    @wait.until{@browser.find_element(:id, 'loggedas').displayed?}
    @select = Selenium::WebDriver::Support::Select.new(@browser.find_element(:id, "project_quick_jump_box"))
    @select.select_by(:text, "Test project50new")
    @browser.find_element(:class, 'settings').click
    @browser.find_element(:id, 'tab-members').click
    @browser.find_element(:css,"a.icon.icon-add").click
    @browser.find_element(:class, 'autocomplete').send_keys 'NewUser1'
    @wait.until{@message.('NewUser1').displayed?}
    @browser.find_element(:name, "membership[user_ids][]").click
    @browser.find_element(:xpath, "//div[@id='principals']/label[51]").click
    @browser.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[5]").click
    @browser.find_element(:id, 'member-add-submit').click
    #assert("New member")
  end
end

  #def test_user_edit
   # @browser.find_element(:xpath, "(//a[contains(text(),'Edit')])[2]").click
    #@browser.find_element(:xpath, "//form[@id='member-144898-roles-form']/p/label[2]/input").click
    #@browser.find_element(:name,"commit").click
  #end
#end


