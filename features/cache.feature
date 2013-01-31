Feature: Cache

    @pending
    Scenario: Check cache-1 is working
        When I check with SSL "cache-1.router" with Host: "www.gov.uk"
        Then I should get a 200 status code

    @pending
    Scenario: Check cache-2 is working
        When I check with SSL "cache-2.router" with Host: "www.gov.uk"
        Then I should get a 200 status code

    @pending
    Scenario: Check cache-3 is working
        When I check with SSL "cache-3.router" with Host: "www.gov.uk"
        Then I should get a 200 status code
