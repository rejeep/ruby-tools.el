Feature: Interpolation
  As a ruby-tools-mode user
  I want to interpolate in double quote strings

  Scenario: Interpolate when in double quote string
    When I insert ""foo""
    And I turn on ruby-mode
    And I go to point "3"
    And I press "#"
    Then I should see ""f#{}oo""
    And the cursor should be between "{" and "}"

  Scenario: Interpolate when in double quote string at the beginning
    When I insert ""foo""
    And I turn on ruby-mode
    And I go to point "2"
    And I press "#"
    Then I should see ""#{}foo""
    And the cursor should be between "{" and "}"

  Scenario: Interpolate when in double quote string at the end
    When I insert ""foo""
    And I turn on ruby-mode
    And I go to point "5"
    And I press "#"
    Then I should see ""foo#{}""
    And the cursor should be between "{" and "}"

  Scenario: Interpolate when in shell command
    When I insert "`foo`"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "#"
    Then I should see "`f#{}oo`"
    And the cursor should be between "{" and "}"

  Scenario: Interpolate when in shell command at the beginning
    When I insert "`foo`"
    And I turn on ruby-mode
    And I go to point "2"
    And I press "#"
    Then I should see "`#{}foo`"
    And the cursor should be between "{" and "}"

  Scenario: Interpolate when in shell command at the end
    When I insert "`foo`"
    And I turn on ruby-mode
    And I go to point "5"
    And I press "#"
    Then I should see "`foo#{}`"
    And the cursor should be between "{" and "}"

  # TODO:
  #   Can not test this because of bug in Ecukes: See:
  #   https://github.com/rejeep/ecukes/issues/58
  #
  # Scenario: Interpolate when in percent syntax string
  #   When I insert "%(foo)"
  #   And I turn on ruby-mode
  #   And I go to point "4"
  #   And I press "#"
  #   Then I should see "%(f#{}oo)"
  #   And the cursor should be between "{" and "}"
  #  
  # Scenario: Interpolate when in percent syntax string at the beginning
  #   When I insert "%(foo)"
  #   And I turn on ruby-mode
  #   And I go to point "3"
  #   And I press "#"
  #   Then I should see "%(#{}foo)"
  #   And the cursor should be between "{" and "}"
  #  
  # Scenario: Interpolate when in percent syntax string at the end
  #   When I insert "%(foo)"
  #   And I turn on ruby-mode
  #   And I go to point "6"
  #   And I press "#"
  #   Then I should see "%(foo#{})"
  #   And the cursor should be between "{" and "}"

  Scenario: Do not interpolate when in single quote string
    When I insert "'foo'"
    And I turn on ruby-mode
    And I go to point "3"
    And I press "#"
    Then I should see "'f#oo'"
