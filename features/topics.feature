Feature: Topics

  Scenario: dynamically checking topic hierarchy
    When I visit "/topic"
    And I should be able to navigate the topic hierarchy
