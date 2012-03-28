Feature: Symbol To String
  As a ruby-tools-mode user
  I want to turn symbols to strings

  Scenario: Turn symbol to single quote string
    When I insert ":foo"
    And I turn on ruby-mode
    And I place the cursor on the symbol "foo"
    And I press "C-'"
    Then I should see "'foo'"

  Scenario: Turn symbol to double quote string
    When I insert ":foo"
    And I turn on ruby-mode
    And I place the cursor on the symbol "foo"
    And I press "C-""
    Then I should see ""foo""

  Scenario: Turn symbol in method argument to single quote string
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I place the cursor on the symbol "bar"
    And I press "C-'"
    Then I should see "foo('bar')"

  Scenario: Turn symbol in method argument to double quote string
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I place the cursor on the symbol "bar"
    And I press "C-""
    Then I should see "foo("bar")"

  Scenario: Do not turn symbol to string when not on symbol
    When I insert "foo(:bar)"
    And I turn on ruby-mode
    And I place the cursor on "foo"
    And I press "C-'"
    Then I should see "foo(:bar)"
