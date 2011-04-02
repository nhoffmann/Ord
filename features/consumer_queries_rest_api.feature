Feature: consumer queries rest api

  In order to use the service in my application 
  As a consumer 
  I want to be able to query the service and retrieve a JSON formatted result
  
  Scenario Outline: Service returns a status
    Given I send and accept JSON
    And the searched word is "<word>"
    When I send a GET request with "<method>"
    Then the status should be "<status>"
    
    Examples:
    | word | method | status |
    | beer | word | 200 |
    | xrfg | word | 404 |
    | beer | starts-with | 200 |
    | xrfg | starts-with | 404 |
    | beer | ends-with | 200 |
    | xrfg | ends-with | 404 |
    | beer | contains | 200 |
    | xrfg | contains | 404 |
    
  Scenario Outline: Service returns arrays when a list of words is expected
    Given I send and accept JSON
    And the searched word is "<word>"
    When I send a GET request with "<method>"
    Then the output should be of type Array
    
    Examples:
    | word | method |
    | beer | starts-with |
    | xrfg | starts-with |
    | beer | ends-with |
    | xrfg | ends-with |
    | beer | contains |
    | xrfg | contains |
    
  Scenario Outline: Service returns words
    Given I send and accept JSON
    And the searched word is "<word>"
    When I send a GET request with "<method>"
    Then the status should be "<status>"
    And the body should contain "<content>"
    
    Examples:
    | word | method | status | content |
    | beer | word | 200 | |
    | xrfg | word | 404 | |
    | beer | starts-with | 200 |beer|
    | xrfg | starts-with | 404 | |
    | beer | ends-with | 200 |beer|
    | xrfg | ends-with | 404 | |
    | beer | contains | 200 |beer|
    | xrfg | contains | 404 | |
    
    