Feature: Topics

  Scenario: dynamically checking topic hierarchy
    Then I should be able to visit:
      | Path               |
      | /topic             |
    And I should be able to navigate the topic hierarchy
