Feature: Browse

  @high
  Scenario: check browse pages load
    When I visit "/browse"
    And I should be able to navigate the browse pages

  @normal
  Scenario: check browse page load, and links
    When I visit "/browse/driving"
    Then I should get a 200 status code
    And I should see "Teaching people to drive"
    When I click on the section "Teaching people to drive"
    Then I should get a 200 status code
    And I should see "Apply to become a driving instructor"
