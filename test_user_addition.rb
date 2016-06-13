require 'test/unit'
require 'selenium-webdriver'
require_relative 'project_helper'

class TestUserAddition < Test::Unit::TestCase

  def setup
    @browser = Selenium::WebDriver.for :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 15)
  end

  def test_run
    register_user
    @browser.find_element(:class, 'logout').click
    @wait.until{@browser.find_element(:id, 'login').displayed?}
    login
   # @browser.find_element(:class, 'settings').click
    #@browser.find_element(:id, 'tab-members').click
    #@browser.find_element(:xpath, "//div[@id='tab-content-members']/p/a").click

  end

end


  #def test_useraddition
    #@browser.find_element(:class, 'autocomplete').send_keys 'andrew'
    #@wait.until{@message.('Andrew Rayner').displayed?}
   # @browser.find_element(:xpath, "//div[@id='principals']/label[6]/input").click
   # @browser.find_element(:xpath, "//div[@id='principals']/label[51]").click
    #@browser.find_element(:xpath, "(//input[@name='membership[role_ids][]'])[5]").click
    #@browser.find_element(:id, 'member-add-submit').click
    #assert("New member")
    #test_user_edit
  #end

  #def test_user_edit
   # @browser.find_element(:xpath, "(//a[contains(text(),'Edit')])[2]").click
    #@browser.find_element(:xpath, "//form[@id='member-144898-roles-form']/p/label[2]/input").click
    #@browser.find_element(:name,"commit").click
  #end
#end


