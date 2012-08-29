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

  Scenario:
    When I search for "child benefit"
    Then I should see "/child-benefit" in the top 10 results
    # ideal: Then I should see "/child-benefit" in the top 3 results

  Scenario:
    When I search for "personal allowance"
    # ideal: Then I should see "/income-tax-rates" in the top 5 results
    Then I should see "/income-tax-rates" in the top 10 results

  Scenario:
    When I search for "benefit"
    # ideal: Then I should not see "/incapacity-benefit" in the top 3 results
    Then I should not see "/incapacity-benefit" in the top 1 result

  Scenario:
    When I search for "incapacity benefit"
    # ideal: Then I should see "/incapacity-benefit" in the top 3 results
    Then I should see "/incapacity-benefit" in the top 10 results

  Scenario:
    When I search for "working from home"
    Then I should see "/flexible-working" in the top 10 results
    And I should see "/travel-disruption-your-rights-at-work" in the top 50 results
#    And I should see "/introduction-to-business-rates" in the top 50 results

  Scenario:
    When I search for "work related activity group"
    # ideal: Then I should see "/employment-support-allowance" in the top 3 results
    Then I should see "/employment-support-allowance" in the top 10 results

  Scenario:
    When I search for "employing people"
    # ideal: Then I should not see "/young-people-in-custody" in the top 10 results
    Then I should not see "/young-people-in-custody" in the top 1 result

