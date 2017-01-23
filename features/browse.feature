Feature: Browse

  @high
  Scenario: check browse pages load
    When I visit "/browse"
    And I should be able to navigate the browse pages
