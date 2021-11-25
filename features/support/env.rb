require 'rubygems'
require 'watir'


# value = "25"
# @browser.text_field(:id=>"EggTimer-start-time-input-text").flash.set value
#
# @browser.p(:class=>"ClassicTimer-time").when_present.text
#
# 25.times do |seconds|
#   # runtime_timer = "#{seconds} seconds"
#   # web_timer = @browser.p(:class=>"ClassicTimer-time").text
#   p @browser.p(:class=>"ClassicTimer-time").text
#   p "#{seconds} seconds"
#   # if runtime_timer == web_timer
#   #   p "Runtime Timer #{runtime_timer} and UI Timer #{web_timer} are equal"
#   # else
#   #   p "Runtime Timer #{runtime_timer} and UI Timer #{web_timer} are not equal"
#   # end
#   sleep 1
# end