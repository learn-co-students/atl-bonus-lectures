# Today

There is a pre-existing (and tested!) command line tic tac toe app we will improve.
We're going to teach a computer player to actually be _decent_.
*Disclaimer*: It might still lose at the end!

# Learning Objectives
* How to write tests
* How tests change our designs
* Benefits of TDD
* What makes testing tricky

## Timeline
5m - Discuss learning objectives and deliverables
5m - Discuss project structure and approach (TDD)
10m - Write failing "basic" tests for smartcomputer class, implement them.
  * Then write a test to take the center when possible.
  * Teach a smartcomputer to recognize its opponent.
10m - Try to write a test case for "avoiding death".
  * This will require refactoring `Board#initialize` and adding `Board#indexes_for`!
  * Maybe use set intersection between a win and indexes here?
5m - Discuss Tic Tac Toe strategy and "Forks".
10m - Block potential forks, not just clear wins.
5m - Discuss benefits of testing.
5m - Talk about what makes testing difficult.

## Writing Tests
* Have a test library and load it.
  * `require 'minitest/autorun'`
  * or add rspec to gemfile, `bundle`, and `rspec --init`
* Have a section for testing one of your classes.
  * `class FooTest < MiniTest::Test` in minitest
  * `describe "Foo" do ... end` in rspec
* "Given, When, Then". Write code to:
  * (Given some data) - Create any needed data/instances.
  * (When I do X) - Run a method to check.
  * (Then I see Y) - Make sure the output matches expectations.
  * In minitest, this code goes in a method whose name starts with `test_`
  * In rspec, this code goes in `it "does this thing" do ... end`

## How Tests Change Design
* How do tests change how you write your program?
  * Dependency Injection.
  * Factoring.

## Tic Tac Toe strategy
* If you can take the center, do so.
* If you can block a win or a fork, do so.
* If you can create a win or a fork, do so.
* If you can take a corner, do so.
* Otherwise, Pick a random square.
* Fork Reference: https://savvavy.wordpress.com/2015/02/01/how-to-beat-medium-cat-dog-toe/

## Benefits of TDD
* Clear next step forward in development. Write a failing test or fix a failure.
* Forces us to build expectations of our code before writing it.
* Strongly encourages breaking up large methods to make things easier to test.

## Tricky Testing
* Tests need to run fast or the inconvenience will lead us to quit testing.
* Tests that modify the database or use an API might not be repeatable or safe.
  * What if a test deletes the last record in a table?
  * What if you need to test code that uses an API to bill customers?
  * Basically any code that uses global/external state or is "impure" is harder to test.
  * In some sense, these should be the "edges" of our program before it goes elsewhere.
* Lots of different approaches to better testing. Read about:
  * Stubbing/mocking and service objects
  * Development vs Test environments
  * FactoryGirl, VCR, etc
  * Lots of talks on this stuff!
    * youtube searches: 'rubyconf testing', 'railsconf testing'

## Good Reading
[Betterspecs]: http://www.betterspecs.org/
[Rails Testing Guide]: https://guides.rubyonrails.org/testing.html