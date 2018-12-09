describe 'testing the demoqa registration page' do

  before(:all) do
    @driver_class = SeleniumQaToolsForm.new
    @driver_class.visit_practice_form
    @wait = Selenium::WebDriver::Wait.new(timeout: 10)
    @first_name = 'Steve'
    @last_name = 'Stevenson'
    @years = rand(0..6)
    @date = '22/11/84'
    @binary = rand(0..1)
    @one_to_three = rand(0..2)
    @country = "Africa"
    @option = "Wait Commands"
  end

  it "should land on the registration page" do
    expect(@driver_class.current_url).to eq 'http://toolsqa.com/automation-practice-form/'
  end

  it "should correctly enter the first name into the first name field" do
    @driver_class.input_first_name_field(@first_name)
    expect(@driver_class.get_first_name_field_value).to eq @first_name
  end

  it "should correctly enter the last name into the last name field" do
    @driver_class.input_last_name_field(@last_name)
    expect(@driver_class.get_last_name_field_value).to eq @last_name
  end

  it "should correctly select the Male option" do
    @driver_class.input_gender_field
    expect(@driver_class.check_enabled_by_id('sex-0')).to eq true
  end

  it "should produce a year value as an integer between 1 and 7" do
    expect(@years).to be_between(0, 6).inclusive
    expect(@years).to be_kind_of(Integer)
  end

  it "should produce a binary value as an integer between 0 and 1" do
    expect(@binary).to be_between(0, 1).inclusive
    expect(@binary).to be_kind_of(Integer)
  end

  it "should produce a one-to-three value as an integer between 0 and 2" do
    expect(@one_to_three).to be_between(0, 2).inclusive
    expect(@one_to_three).to be_kind_of(Integer)
  end

  it "should correctly select a years experinece value" do
    @driver_class.set_experience_to("#{@years}")
    expect(@driver_class.check_enabled_for_experience("#{@years}")).to eq true
  end

  it "should correctly enter a value into the date field" do
    @driver_class.give_text_to_id(@date, 'datepicker')
    expect(@driver_class.check_text_for_id('datepicker')).to eq @date
  end

  it "should correctly select a proffession" do
    @driver_class.set_profession_to("#{@binary}")
    expect(@driver_class.check_enabled_for_profession("#{@binary}")).to eq true
  end

  it "should correctly select an Automation tool" do
    @driver_class.set_tool_to("#{@one_to_three}")
    expect(@driver_class.check_enabled_for_tool("#{@one_to_three}")).to eq true
  end

  it "should correctly select from the dropdown box" do
    @driver_class.select_option_from_dropdown(@country)
    expect(@driver_class.get_text_from_dropdown(@country)).to eq true
  end

  it "should correctly select from the dropdown box" do
    @driver_class.select_option_from_dropdown_2(@option)
    expect(@driver_class.get_text_from_dropdown_2(@option)).to eq true
  end

end
