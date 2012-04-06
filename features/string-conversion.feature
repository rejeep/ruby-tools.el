Feature: String conversion
  As a ruby-tools-mode user
  I want to turn single quote strings to double quote string and reverse

  Scenario: Turn single quote string to double quote string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I place the cursor on the string "foo"
    And I press "C-""
    Then I should see ""foo""

  Scenario: Turn single quote string to double quote string in method call
    When I insert "foo('bar')"
    And I turn on ruby-mode
    And I place the cursor on the string "bar"
    And I press "C-""
    Then I should see "foo("bar")"

  Scenario: Do not turn to single quote string when on single quote string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I place the cursor on the string "foo"
    And I press "C-'"
    Then I should see "'foo'"
    
  Scenario: Turn double quote string to single quote string
    When I insert ""foo""
    And I turn on ruby-mode
    And I place the cursor on the string "foo"
    And I press "C-'"
    Then I should see "'foo'"
    
  Scenario: Turn double quote string to single quote string in method call
    When I insert "foo("bar")"
    And I turn on ruby-mode
    And I place the cursor on the string "bar"
    And I press "C-'"
    Then I should see "foo('bar')"

  Scenario: Do not turn to double quote string when on double quote string
    When I insert ""foo""
    And I turn on ruby-mode
    And I place the cursor on the string "foo"
    And I press "C-""
    Then I should see ""foo""
