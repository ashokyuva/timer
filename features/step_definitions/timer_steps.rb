
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
  timer.validate_countdown_value
end

And(/^click on the start button$/) do
  timer.click_start
end

When(/^countdown is happening every second, verify it$/) do
  timer.validate_timer
end

Then(/^validate the remaining time decreases in one\-second increments$/) do

end

And(/^close the browser$/) do
  close_driver
end

