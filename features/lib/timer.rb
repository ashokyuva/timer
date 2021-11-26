require 'yaml'
require 'json'

class Timer
  attr_accessor :logger, :browser, :result

  # Method to initiate the class
  # Constructor
  def initialize(browser)
    @browser = browser
    @logger = Logger.new(STDOUT)
    @path = File.join(File.expand_path("." , Dir.pwd), "features" ,"config", "user_data.yml")
  end

  # Method to load the yml data file from config folder
  def load_data
    @data = YAML.load_file(@path)
    logger.info @data
  end

  # Method to validate the yml file
  def validate_yml
    Dir.glob(@path) { |file|
      begin
        YAML.parse(File.open(file))
        logger.info "USER INPUT file => \e[32mvalid\e[0m"
      rescue => exception
        logger.info "USER INPUT file => \e[31minvalid\e[0m"
        fail
      end
    }
  end

  # Method to open the browser
  def open_browser
    browser
  end

  # Method to confirm the Page loaded or not
  def validate_page_load
    begin
      browser.div(:class=>"EggTimer-start-content").exists?
      browser.text_field(:id=>"EggTimer-start-time-input-text").flash.exists?
      logger.info "Home Page has been loaded successfully"
      browser.screenshot.save("HomePage.png")
    rescue => exception
      raise exception
    end
  end

  # Method to set the timer value
  def set_countdown(countdown)
    browser.text_field(:id=>"EggTimer-start-time-input-text").flash.set countdown
  end

  # Method to validate the timer value
  # Valid values - 25 sec, 25 seconds
  # Invalid values - 25 s
  def validate_countdown_value
    start_message = browser.button(:text => "Start").attribute_value("data-tip")
    if start_message.include? "Please enter a valid time"
      logger.error start_message
    else
      logger.info start_message
    end
  end

  # Method to click the start button
  def click_start
    browser.button(:class=>"validTime").when_present.flash.click!
    logger.info "Start button clicked"
  end

  # Method to verify countdown is happening every second
  def validate_timer
    begin
      @result = {}
      loop do
        time_now = Time.now.strftime('%H:%M:%S')
        value_now = browser.p(:class=>"ClassicTimer-time").text
        @result[time_now] = value_now
        sleep 0.9
        logger.info "Time now #{time_now} and Value now #{value_now}"
        break if value_now.to_i.zero?
      end
    rescue Exception => e
      logger.info e
    end
  end
end