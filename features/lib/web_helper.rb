module Countdown
  def driver
    unless defined?(@@driver)
      path = File.join(File.expand_path("." , Dir.pwd), "features" ,"config", "user_data.yml")
      data = YAML.load_file(path)
      @@driver = Watir::Browser.new
      @@driver.goto(data["site"]["url"])
      @@driver.driver.manage.window.maximize
    end
    @@driver
  end

  def close_driver
    @@driver.close
    @@driver = nil
  end

  def logger
    Logger.new(STDOUT)
  end

  def timer
    @timer = Timer.new(driver)
  end
end

