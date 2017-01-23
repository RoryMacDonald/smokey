Feature: Calculators app

  @normal
  Scenario: Accessing the child benefit tax calculator
    When I visit "/child-benefit-tax-calculator"
    Then I should see "Child Benefit tax calculator"

    When I visit "/child-benefit-tax-calculator/main"
    Then I should see "Child Benefit tax calculator"
