Feature: Search

  @high
  Scenario: check search results
    When I search for "tax"
    Then I should see some search results

  @normal
  Scenario: check organisation filtering
    When I search for "policy"
    Then I should see organisations in the organisation filter

  @normal
  Scenario: check sitemap
    When I get the sitemap index
    Then It should contain a link to at least one sitemap file
    And I should be able to get all the referenced sitemap files
