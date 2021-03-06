Feature: Sign-on-o-tron
  @high
  Scenario: Can log in
    When I try to login as a user
    Then I should see "Welcome to GOV.UK"

  @low
  Scenario: Signon cookies are marked as secure and HttpOnly
    When I go to the "signon" landing page
    Then I should receive a "_signonotron2_session" cookie which is "secure"
     And I should receive a "_signonotron2_session" cookie which is "HttpOnly"
