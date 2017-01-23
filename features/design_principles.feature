Feature: Design Principles

  @normal
  Scenario: check Design Principles
    When I visit "/design-principles"
    Then I should get a 200 status code
    And I should see "Start with user needs"

  @normal
  Scenario: check Transformation dashboard
    When I visit "/transformation"
    Then I should get a 200 status code
    And I should see "Digital Transformation"
