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
