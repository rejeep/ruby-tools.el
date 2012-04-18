Feature: Symbol To String
  As a ruby-tools-mode user
  I want to turn symbols to strings

  Scenario: Turn symbol to single quote string
    When I insert ":foo"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "C-'"
    Then I should see "'foo'"
    And the cursor should be between "f" and "oo"

  Scenario: Turn symbol to double quote string
    When I insert ":foo"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "C-""
    Then I should see ""foo""
    And the cursor should be between "f" and "oo"

  Scenario: Turn symbol in method argument to single quote string
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I go to point "7"
    And I press "C-'"
    Then I should see "foo('bar')"
    And the cursor should be between "b" and "ar"

  Scenario: Turn symbol in method argument to double quote string
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I go to point "7"
    And I press "C-""
    Then I should see "foo("bar")"
    And the cursor should be between "b" and "ar"
    
  Scenario: Turn symbol in to string when at beginning of symbol
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I go to point "6"
    And I press "C-'"
    Then I should see "foo('bar')"
    And the cursor should be before "bar"
    
  Scenario: Turn symbol in to string when at end of symbol
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I go to point "9"
    And I press "C-'"
    Then I should see "foo('bar')"
    And the cursor should be after "bar"

  Scenario: Do not turn symbol to string when not on symbol
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "C-'"
    Then I should see "foo(:bar)"
    And the cursor should be between "fo" and "o"

  Scenario: Do not turn symbol to string when symbol in string
    When I insert "'foo :bar baz'"
    And I turn on ruby-mode
    And I go to point "8"
    And I press "C-'"
    Then I should see "'foo :bar baz'"
    And the cursor should be between "oo :b" and "ar ba"

  Scenario: Turn empty symbol to string
    When I insert ":"
    And I turn on ruby-mode
    And I go to point "2"
    And I press "C-'"
    Then I should see "''"
    And the cursor should be between "'" and "'"
