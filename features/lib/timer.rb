require 'yaml'
require 'json'

class Timer
  attr_accessor :logger, :browser

  def initialize(browser)
    @browser = browser
    @logger = Logger.new(STDOUT)
    @path = File.join(File.expand_path("." , Dir.pwd), "features" ,"config", "user_data.yml")
  end

  def load_data
    @data = YAML.load_file(@path)
    logger.info @data
  end

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

  def open_browser
    browser
  end

  def validate_page_load
    begin
      browser.div(:class=>"EggTimer-start-content").exists?
      browser.text_field(:id=>"EggTimer-start-time-input-text").flash.exists?
      logger.info "Home Page has been loaded successfully"
      # browser.screenshot.save("HomePage.png")
    rescue => exception
      raise exception
    end
  end

  def set_countdown(countdown)
    browser.text_field(:id=>"EggTimer-start-time-input-text").flash.set countdown
  end

  def validate_countdown
    start_message = browser.button(:text => "Start").attribute_value("data-tip")
    if start_message.include? "Please enter a valid time"
      logger.error start_message
    else
      logger.info start_message
    end
  end

  def click_start
    browser.button(:class=>"validTime").when_present.flash.click!
    logger.info "Start button clicked"
  end

end