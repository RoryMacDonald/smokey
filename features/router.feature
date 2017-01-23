Feature: Router

  @high
  Scenario: check router loads homepage
    Then I should be able to visit:
      | Path      |
      | /         |
