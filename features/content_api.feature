Feature: Content API

@high
Scenario: (Public) Content API availability
  When I request "/api/vehicle-tax.json"
  Then I should get a 200 status code
  And I should see "Tax your vehicle"
