require 'selenium-webdriver'
require 'page-object'


browser = Selenium::WebDriver.for :chrome
browser.manage.timeouts.implicit_wait = 15
browser.manage.window.maximize

class VinsolTesting
  include PageObject
  @username = "admin"
  @password = "admin"

  button(:vinsol_login_page_button, :xpath => '//*[@id="root"]/div/div[2]/div/div/div/div/div[3]/header/div[2]/div[3]/div[2]/button')
  text_field(:username_field, :name => 'email')
  text_field(:password_field, :name => 'password')
  button(:log_in, :type => 'submit')
  link(:start_an_order_button, :text => 'Start an order')
  link(:start_new_order_button, :text => 'or, Start a New Order')
  text_field(:treat_name, :id => 'treatName')
  text_field(:from,:id => 'senderName')
  elements(:options, :class => 'custom-border-radio-content')
  div(:snacks_and_swags, :xpath => '//*[@id="send-a-treat"]/div[3]/div[2]/div[3]/div/label/div[1]/div[1]/div[1]')
  elements(:green_button, :class =>'button-program-green')
  text_field(:total_reciepents, :name => 'expectedCount')
  text_field(:international_reciepents, :name => 'internationalCount')
  element(:payment_button, :class => 'btn-primary')

  class << self
    attr_accessor :username, :password
  end

  page_url('https://' + username + ':' + password + '@' + 'automation-frontend.snackmagic.com/')

  def login
    goto
  end

  def login_site
    vinsol_login_page_button
    self.username_field = 'avneet+4444@vinsol.com'
    self.password_field = 'Vinsol1.'
    log_in
  end

  def start_an_order
    start_an_order_button
  end

  def start_new_order
    start_new_order_button
  end

  def fill_create_a_new_treat
    self.treat_name = 'test_treat'
    self.from = 'ABC'
    options_elements[0].click
    snacks_and_swags_element.click
    log_in
  end

  def budget_treat
    sleep(4)

    options_elements[0].click
    green_button_elements[0].click
    sleep(3)

    options_elements[0].click
    green_button_elements[0].click
    sleep(3)

    options_elements[0].click
    green_button_elements[0].click
    sleep(3)

    self.total_reciepents = 100
    self.international_reciepents = 10
    green_button_elements[0].click
    sleep(3)

    green_button_elements[0].click
    sleep(3)

    options_elements[1].click
    green_button_elements[0].click
    sleep(3)

    green_button_elements[0].click
    sleep(3)

    options_elements[0].click
    green_button_elements[0].click
    sleep(3)

    green_button_elements[0].click
    sleep(3)

    green_button_elements[0].click
    sleep(3)

    options_elements[1].click
    green_button_elements[0].click
    sleep(3)

    options_elements[1].click
    green_button_elements[0].click
    sleep(3)

    options_elements[1].click
    green_button_elements[0].click
    sleep(3)

    options_elements[0].click
    green_button_elements[0].click
    sleep(3)

    options_elements[1].click
    green_button_elements[0].click
    sleep(3)

    options_elements[2].click
    green_button_elements[0].click
    sleep(3)

    options_elements[1].click
    green_button_elements[0].click
    sleep(3)
  end

  def payment
    self.payment_button_element.click
    sleep(4)
    options_elements[0].click
    green_button_elements[0].click
    sleep(3)

    options_elements[0].click
    green_button_elements[0].click
    sleep(10)

    options_elements[2].click
    green_button_elements[0].click
    sleep(5)
  end

end

vt = VinsolTesting.new(browser)
vt.login
vt.login_site
vt.start_an_order
vt.start_new_order
vt.fill_create_a_new_treat
vt.budget_treat
vt.payment

sleep 5
