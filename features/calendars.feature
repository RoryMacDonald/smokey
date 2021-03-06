Feature: Calendars

  @normal
  Scenario: check calendars loads
    Given I am testing through the full stack
    And I force a varnish cache miss
    Then I should be able to visit:
      | Path                       |
      | /when-do-the-clocks-change |
      | /bank-holidays             |

  @normal
  Scenario: check alternative formats are available
    Given I am testing through the full stack
    Then I should be able to visit:
      | Path                            |
      | /when-do-the-clocks-change/united-kingdom.json |
      | /when-do-the-clocks-change/united-kingdom.ics  |

  @normal
  Scenario: check bank holidays JSON format is consistent
    Given I am testing through the full stack
    When I request "/bank-holidays.json"
    Then JSON is returned
