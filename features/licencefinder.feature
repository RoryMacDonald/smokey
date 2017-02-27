Feature: Licence Finder

  @normal
  Scenario: check licence finder loads
    Then I should be able to visit:
      | Path                                                              |
      | /licence-finder                                                   |
      | /licence-finder/sectors                                           |
      | /licence-finder/sectors?sectors=&q=pub                            |
      | /licence-finder/activities?sectors=59                             |
      | /licence-finder/location?sectors=59&activities=149                |
      | /licence-finder/licences?activities=149&location=wales&sectors=59 |

  @normal
  Scenario: check licence finder returns licences
    When I visit "/licence-finder/licences?activities=149&location=wales&sectors=59"
    Then I should see "A premises licence is for carrying out 'licensable activities' at a particular venue"

  @low
  @benchmarking
  Scenario: Quickly loading the licence finder home page
    Given I am benchmarking
    When I visit "/licence-finder"
    Then the elapsed time should be less than 1 seconds
