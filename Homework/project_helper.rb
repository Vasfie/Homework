module ProjectHelper

  def setup_browser
    @browser = Selenium::WebDriver.for :firefox
  end

  def create_project
    project_name = ('Test project' + rand(100).to_s)
    #@browser.navigate.to 'http://demo.redmine.org/projects'
    @browser.find_element(:css, "a.icon.icon-add").click
    @browser.find_element(:id, 'project_name').send_keys (project_name + 'new')
    @browser.find_element(:css, "div.box.tabular").send_keys 'Lorem ipsum'
    @browser.find_element(:name, 'continue').click
  end

end

def login
  @browser.navigate.to 'http://demo.redmine.org'
  @browser.find_element(:class, 'login').click
  @wait.until{@browser.find_element(:id, 'username').displayed?}
  @browser.find_element(:id, 'username').send_keys 'UserUser'
  @browser.find_element(:id, 'password').send_keys '1234567asd'
  @browser.find_element(:name, 'login').click
  @wait.until{@browser.find_element(:id, 'loggedas').displayed?}
end

def register_user
  @browser.navigate.to 'http://demo.redmine.org'
  @browser.find_element(:class, 'register').click
  @wait.until{@browser.find_element(:id, 'user_login').displayed?}
  login = ('login' + rand(100).to_s)
  @browser.find_element(:id, 'user_login').send_keys login
  @browser.find_element(:id, 'user_password').send_keys '1234567asd'
  @browser.find_element(:id, 'user_password_confirmation').send_keys '1234567asd'
  @browser.find_element(:id, 'user_firstname').send_keys 'New'
  @browser.find_element(:id, 'user_lastname').send_keys 'user'
  @browser.find_element(:id, 'user_mail').send_keys (login + '@gmail.com')
  @browser.find_element(:name, 'commit').click
  assert(@browser.find_element(:class, 'flash notice').displayed?)
end