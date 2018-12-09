require 'selenium-webdriver'

class SeleniumQaToolsForm

  def initialize
    @chrome_driver = Selenium::WebDriver.for :chrome
    @practice_form_url = "http://toolsqa.com/automation-practice-form/"
    @first_name_field_name = 'firstname'
    @last_name_field_name = 'lastname'
    @gender_field_id = "sex-0"
  end

  def visit_practice_form
    @chrome_driver.get(@practice_form_url)
  end

  def input_first_name_field(text)
    @chrome_driver.find_element(:name, @first_name_field_name).send_keys(text)
  end

  def input_last_name_field(text)
    @chrome_driver.find_element(:name, @last_name_field_name).send_keys(text)
  end

  def input_gender_field
    @chrome_driver.find_element(:id, @gender_field_id).click
  end

  def current_url
    @chrome_driver.current_url
  end

  def get_first_name_field_value
    @chrome_driver.find_element(:name, @first_name_field_name).attribute('value')
  end

  def get_last_name_field_value
    @chrome_driver.find_element(:name, @last_name_field_name).attribute('value')
  end

  def check_enabled_by_id(search_id)
    @chrome_driver.find_element(:id, search_id).enabled?
  end

  def set_experience_to(years)
    @chrome_driver.find_element(:id, "exp-#{years}").click
  end

  def check_enabled_for_experience(years)
    @chrome_driver.find_element(:id, "exp-#{years}").enabled?
  end

  def give_text_to_id(text, id)
    @chrome_driver.find_element(:id, "#{id}").send_keys(text)
  end

  def check_text_for_id(id)
    @chrome_driver.find_element(:id, "#{id}").attribute('value')
  end

  def set_profession_to(binary)
    @chrome_driver.find_element(:id, "profession-#{binary}").click
  end

  def check_enabled_for_profession(binary)
    @chrome_driver.find_element(:id, "profession-#{binary}").enabled?
  end

  def set_tool_to(one_to_three)
    @chrome_driver.find_element(:id, "tool-#{one_to_three}").click
  end

  def check_enabled_for_tool(one_to_three)
    @chrome_driver.find_element(:id, "tool-#{one_to_three}").enabled?
  end

  def select_option_from_dropdown(country)
    option = Selenium::WebDriver::Support::Select.new(@chrome_driver.find_element(:id, "continents"))
    option.select_by(:text, "#{country}")
  end

  def get_text_from_dropdown(country)
    @chrome_driver.find_element(:id, "continents").text.include?(country)
  end

  def select_option_from_dropdown_2(input)
    option = Selenium::WebDriver::Support::Select.new(@chrome_driver.find_element(:id, "selenium_commands"))
    option.select_by(:text, "#{input}")
  end

  def get_text_from_dropdown_2(input)
    @chrome_driver.find_element(:id, "selenium_commands").text.include?(input)
  end

end

test = SeleniumQaToolsForm.new

# test.visit_practice_form
# test.input_first_name_field('Steve')
# test.input_last_name_field('Stevenson')
# test.input_gender_field

sleep 3
