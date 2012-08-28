Feature: Search

  Background:
    Given the "search" application has booted
    And I am testing through the full stack
    And I force a varnish cache miss

  Scenario: check search loads
    Then I should be able to visit:
      | Path            |
      | /search         |
      | /search?q=tax   |
      | /browse         |
      | /browse/driving |

  Scenario: check child benefit
    When I search for "child benefit"
    Then I should see "/child-benefit" in the top 10 results

  Scenario: check personal allowance
    When I search for "personal allowance"
    Then I should see "/income-tax-rates" in the top 10 results

