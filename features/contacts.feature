Feature: Contacts

  @normal
  Scenario: viewing contacts finder
    When I visit "/government/organisations/hm-revenue-customs/contact"
    Then I should see "HM Revenue &amp; Customs Contacts"

  @normal
  Scenario: viewing a contact
    When I visit "/government/organisations/hm-revenue-customs/contact/child-benefit"
    Then I should see "Child Benefit"
