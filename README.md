# BDD Automation with RUBY and CUCUMBER

Automation timer application - Requirements

Automation Scripting Language - Ruby 
https://www.ruby-lang.org/en/

Automation Framework - BDD Cucumber
https://cucumber.io/docs/tools/ruby/

Automation Webdriver - Watir
http://watir.com/guides/form-example/

Version control tool - Gitub 
https://github.com/

IDE - Rubymine
https://www.jetbrains.com/ruby/

# Ruby Installation Guide

1. Go to [Ruby Installer](http://rubyinstaller.org/ "Ruby Installer") in your web browser
2. Click **ruby 2.6.5p114** near the top of the RubyInstallers list.
3. Run the installer program by choosing Run Program (if Windows presents this option) or double-clicking the file when its done downloading. 
4. The installer will ask you to select a language to use during installation. Accept the license, and then the installer will have you set some configuration options. Leave the default folder choice alone, but* uncheck the Install Tcl/Tk Support check box, and make sure that the other two check boxes.* Add Ruby Executables to Your PATH and Associate .rb and .rbw  Files with This Ruby Installation are selected.
5. After installation open the command prompt and enter **ruby -v** it should return the installed ruby version.
6. Use ***gem install --library name*** to install any external libraries like *cucumber, watir, etc*

# Cucumber Installation Guide
In order to get better advantage of the software testing, organizations are nowadays taking a step forward. They implement important acceptance test scenarios while development is in-progress. This approach is commonly known as Behavior Driven Development (BDD)
> open the command prompth and use **gem install cucumber** 

After gem has been successfully installed in your project folder. Use the below commant to initiate cucumber
> *cucumber --init*

The required folders will be generated automatically in the project folder as below,

> create   features
create   features/step_definitions
create   features/support
create   features/support/env.rb

```
$ cucumber.feature file
Feature: Test

  Scenario: Hello                        					 # features/hello.feature:3
    When I run the "hello-world" program 	# features/hello.feature:4
	Then I should see "Hello World"      		 # features/hello.feature:5

1 scenario (1 undefined)
2 steps (2 undefined)
0m0.007s

You can implement step definitions for undefined steps with these snippets:

When(/^I run the "([^"]*)" program$/) do |arg1|
  pending  # Write code here that turns the phrase above into concrete actions
end
```
# Watir Installation Guide 
Watir, is an open-source family of Ruby libraries for automating web browsers. It drives Internet Explorer, Firefox, Chrome, Opera and Safari, and is available as a RubyGems gem. 

Once you have installed Ruby, installing and using Watir is easy.

From the command line, install the gem, which Ruby’s way of packaging code:

> gem install watir

# Gitub Installation Guide
GitHub is a provider of Internet hosting for software development and version control using Git. It offers the distributed version control and source code management functionality of Git, plus its own features.

After the instllation of Ruby, Watir and Cucumber, we can gohead with the GIT installation.

- Get a [github](https://github.com/ "github") account.
- Download and install [git](https://git-scm.com/downloads "git").
- Set up git with your user name and email.

Open a terminal/shell and type:

```shell
$ git config --global user.name "Your name here"
$ git config --global user.email "your_email@example.com"
$ git config --global color.ui true
(Don’t type the $; that just indicates that you’re doing this at the command line.)
```
- Look to see if you have files ~/.ssh/id_rsa and ~/.ssh/id_rsa.pub.
- If not, create such public/private keys: Open a terminal/shell and type:

> $ ssh-keygen -t rsa -C "your_email@example.com"

Paste your ssh public key into your github account settings.

- Go to your github [Account Settings](https://github.com/settings/profile "Account Settings")
- Click “[SSH Keys](https://github.com/settings/ssh "SSH Keys")” on the left.
- Click “Add SSH Key” on the right.
- Add a label (like “My laptop”) and paste the public key into the big text box.
- In a terminal/shell, type the following to test it:

> $ ssh -T git@github.com

If it says something like the following, it worked:

> Hi username! You've successfully authenticated, but Github does
not provide shell access.

# Rubymine IDE Installation Guide

Download the Rubymine IDE from the below link,
https://www.jetbrains.com/ruby/download

And complete the installation. 

# Steps to create our Project
### Step1- Create Ruby Project in rubymine
> File->New Project (Project name - Timer)

### Step2 - Create Gem file
- Select project directory, right click and click New->File
- Create Gem file with the following Gem details as shown below.

```ruby
source 'http://rubygems.org'

gem 'cucumber', '2.3.3'
gem 'ffi', '1.11.3'
gem 'watir', '6.10.3'
gem 'selenium-webdriver'
gem 'yaml'
gem 'logger'
```
### Step3 - Directory Structure
- Create sub folders as shown below

```html
features
-> timer_feature
	-> timer.feature
-> config
	-> user_data.yml
-> lib
	-> timer.rb
-> step_definitions
	-> timer_steps.rb
-> Support
	-> env.rb
Gemfile
```
### Step4 - Create Shared Driver
Create env.rb inside Support folder with the following code.
```ruby
require 'rubygems'
require 'rspec'
require 'watir-webdriver'
 
#Creating Remote WebDriver
browser = Watir::Browser.new(:remote, :url =&gt; "http://SauceUsername:SauceKey@ondemand.saucelabs.com:80/wd/hub",
                              :desired_capabilities =&gt; WebDriver::Remote::Capabilities.firefox)
#If you want to run it locally, use Watir::Browser.new :firefox
                               
Before do
  @browser = browser
end
```
### Step5 - Create Feature file
Create timer.feature file inside feature folder with the below steps
```ruby
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
```
### Step6 - Create Step Definitions
Create Step Definitions with pending steps
```ruby

Given(/^the user input file is loaded$/) do
  @timer = Timer.new
  @timer.load_data
end

When(/^user input file is not empty$/) do
  @timer.validate_yml
end

Given(/^open the browser and enter the url$/) do
  @timer.open_browser
end

When(/^page load is completed$/) do
  @timer.validate_page_load
end

Then(/^enter the (.*) time in the text field$/) do |countdown|
  @timer.set_countdown(countdown)
end
```
### Step7 - Create Page Object
```ruby
require 'yaml'
require 'json'

class Timer
  attr_accessor :logger, :browser

  def initialize
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
    @browser = Watir::Browser.new
    browser.goto(@data["site"]["url"])
    browser.driver.manage.window.maximize
  end
end
```
### Step9 - Create cucumber.yml file
Create cucumber.yml file inside project directory as shown below

> default: --format html --out=timer_report.html

### Step10 - Run the feature file

> $ cucumber features/timer_feature.rb

After execution, **timer_report.html** will be available in the root folder of the project
