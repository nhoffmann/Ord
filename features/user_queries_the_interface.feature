Feature: User queries the interface

  In order to investigate words or parts of words
  As a user of the human interface
  I want to fill out the query form and submit it

  @javascript
  Scenario: Search for a word
    Given I am on "interface"
    When I fill in "query" with "beer"
    And I select "ends-with" from "method"
    And I press "submit"
    Then I should see "beer"