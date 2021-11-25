
Given(/^the user input file is loaded$/) do
  timer.load_data
end

When(/^user input file is not empty$/) do
  timer.validate_yml
end

Given(/^open the browser and enter the url$/) do
  timer.open_browser
end

When(/^page load is completed$/) do
  timer.validate_page_load
end

Then(/^enter the (.*) time in the text field$/) do |countdown|
  p countdown
  timer.set_countdown(countdown)
end

And(/^validate the valid timer value$/) do
  timer.validate_countdown
end

And(/^click on the start button$/) do
  timer.click_start
  @start_time = Time.now
end

When(/^countdown is happening every second, verify it$/) do
  begin
    @result = {}
    loop do
      time_now = Time.now.strftime('%H:%M:%S')
      value_now = driver.p(:class=>"ClassicTimer-time").text
      @result[time_now] = value_now
      sleep 0.9
      logger.info "Time now #{time_now} and Value now #{value_now}"
    end
  rescue Exception => e
    p e
  end
end

Then(/^validate the remaining time decreases in one\-second increments$/) do

end

And(/^close the browser$/) do

end

