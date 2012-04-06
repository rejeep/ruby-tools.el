Feature: String To Symbol
  As a ruby-tools-mode user
  I want to turn strings to symbols

  Scenario: Turn single quote string to symbol
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to word "foo"
    And I press "C-:"
    Then I should see ":foo"

  Scenario: Turn double quote string to symbol
    When I insert ""foo""
    And I turn on ruby-mode
    And I go to word "foo"
    And I press "C-:"
    Then I should see ":foo"

  Scenario: Turn single quote string in method argument to symbol
    When I insert "foo('bar')"
    And I turn on ruby-mode
    And I go to word "bar"
    And I press "C-:"
    Then I should see "foo(:bar)"

  Scenario: Turn double quote string in method argument to symbol
    When I insert "foo("bar")"
    And I turn on ruby-mode
    And I go to word "bar"
    And I press "C-:"
    Then I should see "foo(:bar)"

  Scenario: Turn single quote string with underscores to symbol
    When I insert "'foo_bar'"
    And I turn on ruby-mode
    And I go to word "foo_bar"
    And I press "C-:"
    Then I should see ":foo_bar"
    
  Scenario: Turn string to symbol when at beginning of string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to point "2"
    And I press "C-:"
    Then I should see ":foo"
    
  Scenario: Turn string to symbol when at end of string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to point "4"
    And I press "C-:"
    Then I should see ":foo"

  Scenario: Do not turn symbol to string when not on a string
    When I insert "foo('bar')"
    And I turn on ruby-mode
    And I go to word "foo"
    And I press "C-:"
    Then I should see "foo('bar')"

  Scenario: Do not turn symbol to string when invalid symbol characters in string
    When I insert "'foo bar'"
    And I turn on ruby-mode
    And I go to word "foo bar"
    And I press "C-:"
    Then I should see "'foo bar'"
