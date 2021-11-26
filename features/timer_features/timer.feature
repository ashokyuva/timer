# Feature Responsible: <AAA@abc.com>
# Author <XXXX@abc.com>
# Updated by <YYY@abc.com>
# Reviewed by <ZZZ@abc.com>
# Status <Completed>
# <NotStarted, InProgress, InReview, Completed>

# Automation Info
# Owner <ASHOK@abc.com>,<23-11-2021>
# Code Reviewed by <XXX@abc.com>,<24-11-2021>
# Functionality Reviewed by <YYY@abc.com, ZZZ@abc.com>,<24-11-2021>
# Status <In-Production>

Feature: Countdown Timer
  This feature has a countdown functionality
  The countdown function should use the period specified on the home page as the start time and count down every second

  Background:
    Given the user input file is loaded
    When user input file is not empty

  Scenario: Verify the web page and enter the user inputs
    Given open the browser and enter the url
    When page load is completed
    Then enter the 25 seconds time in the text field
    And validate the valid timer value
    And click on the start button

  Scenario: Verify the timer countdown
    When countdown is happening every second, verify it
    Then validate the remaining time decreases in one-second increments
    And close the browser