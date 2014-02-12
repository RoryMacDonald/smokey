Feature: Mirror

# These Cucumber tests run against the mirrors.
# Despite the fact that Varnish doesn't run in static, we force cachebusts anyway in case we do run Varnish on static in future.

  @high
  Scenario: check for HTTP 200 response on provider0
    Given I am testing the mirror in "provider0"
    When I visit "/"
    Then I should get a 200 status code

  @high
  Scenario: check for HTTP 200 response on provider1
    Given I am testing the mirror in "provider1"
    When I visit "/"
    Then I should get a 200 status code

  @high
  Scenario: check for correct homepage content on provider0
    Given I am testing the mirror in "provider0"
    Then I should see the departments and policies section on the homepage
    And I should see the services and information section on the homepage

  @high
  Scenario: check for correct homepage content on provider1
    Given I am testing the mirror in "provider1"
    Then I should see the departments and policies section on the homepage
    And I should see the services and information section on the homepage

  @normal
  Scenario: check for correct response from deep-linked page on provider0
    Given I am testing the mirror in "provider0"
    When I visit "/council-tax-reduction"
    Then I should get a 200 status code

  @normal
  Scenario: check for correct response from deep-linked page on provider1
    Given I am testing the mirror in "provider1"
    When I visit "/council-tax-reduction"
    Then I should get a 200 status code

  @normal
  Scenario: check search returns a 503 on provider0
    # Search is a separate application which will not be booted, therefore searches should return 503
    Given I am testing the mirror in "provider0"
    When I search for "cheesecake"
    Then I should get a 503 status code
    And I should see "This page cannot be found"

  @normal
  Scenario: check search returns a 503 on provider1
    # Search is a separate application which will not be booted, therefore searches should return 503
    Given I am testing the mirror in "provider1"
    When I search for "cheesecake"
    Then I should get a 503 status code
    And I should see "This page cannot be found"

  @normal
  Scenario: Return a 503 for 404s on provider0
    # On static, we return 503s for 404s
    Given I am testing the mirror in "provider0"
    When I visit "/jasdu3jjasd"
    Then I should get a 503 status code

  @normal
  Scenario: Return a 503 for 404s on provider1
    # On static, we return 503s for 404s
    Given I am testing the mirror in "provider1"
    When I visit "/jasdu3jjasd"
    Then I should get a 503 status code
