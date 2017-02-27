Feature: Browse

  @high
  Scenario: check browse pages load
    Then I should be able to visit:
      | Path            |
      | /browse         |
    And I should be able to navigate the browse pages
