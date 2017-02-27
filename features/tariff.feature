Feature: Trade Tariff

  @normal
  Scenario: Visiting trade tariff
    Then I should be able to visit:
      | Path                                  |
      | /trade-tariff/                        |
      | /trade-tariff/sections                |
      | /trade-tariff/chapters/01             |
      | /trade-tariff/headings/0101           |
      | /trade-tariff/commodities/0101210000  |

  @normal
  Scenario: Displaying Grouped headings
    When I visit "/trade-tariff/headings/6309"
    # Grouped commodity code should be displayed
    Then I should see "6309000000"

  @normal
  Scenario: Searching trade tariff
    Then I should be able to search the tariff and see matching results
