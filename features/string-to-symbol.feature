Feature: String To Symbol
  As a ruby-tools-mode user
  I want to turn strings to symbols

  Scenario: Turn single quote string to symbol
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "C-:"
    Then I should see ":foo"
    And the cursor should be between "f" and "oo"

  Scenario: Turn double quote string to symbol
    When I insert ""foo""
    And I turn on ruby-mode
    And I go to point "3"
    And I press "C-:"
    Then I should see ":foo"
    And the cursor should be between "f" and "oo"

  Scenario: Turn single quote string in method argument to symbol
    When I insert "foo('bar')"
    And I turn on ruby-mode
    And I go to point "7"
    And I press "C-:"
    Then I should see "foo(:bar)"
    And the cursor should be between "b" and "ar"

  Scenario: Turn double quote string in method argument to symbol
    When I insert "foo("bar")"
    And I turn on ruby-mode
    And I go to point "7"
    And I press "C-:"
    Then I should see "foo(:bar)"
    And the cursor should be between "b" and "ar"

  Scenario: Turn single quote string with underscores to symbol
    When I insert "'foo_bar'"
    And I turn on ruby-mode
    And I go to point "5"
    And I press "C-:"
    Then I should see ":foo_bar"
    And the cursor should be between "foo" and "_bar"
    
  Scenario: Turn string to symbol when at beginning of string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to point "2"
    And I press "C-:"
    Then I should see ":foo"
    And the cursor should be before "foo"
    
  Scenario: Turn string to symbol when at end of string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to point "5"
    And I press "C-:"
    Then I should see ":foo"
    And the cursor should be after "foo"

  Scenario: Do not turn symbol to string when not on a string
    When I insert "foo('bar')"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "C-:"
    Then I should see "foo('bar')"
    And the cursor should be between "fo" and "o"

  Scenario: Do not turn symbol to string when invalid symbol characters in string
    When I insert "'foo bar'"
    And I turn on ruby-mode
    And I go to point "4"
    And I press "C-:"
    Then I should see "'foo bar'"
    And the cursor should be between "fo" and "o b"

 Scenario: Turn empty string to symbol
    When I insert "''"
    And I turn on ruby-mode
    And I go to point "2"
    And I press "C-:"
    Then I should see ":"
    And the cursor should be after ":"
