Feature: consumer queries rest api

  In order to use the service in my application 
  As a consumer 
  I want to be able to query the service and retrieve a JSON formatted result
    
  Scenario Outline: Service returns a hash
    Given I send and accept JSON
    And the searched word is "<word>"
    When I send a GET request with "<method>"
    Then the output should be of type Hash
    
    Examples:
    | word | method |
    | beer | word |
    | xrfg | word |
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
    And the returned content type should be json
    And the body should return json that equals this "<json>"
    
    Examples:
    | word | method | status | json |
    | beer | word | 200 |{'query_string':'beer', 'word_in_list':true, 'content':{'previous':'beeps','next':'beerier'}}|
    | xrfg | word | 200 |{'query_string':'xrfg', 'word_in_list':false, 'content':{}}|
    | beer | starts-with | 200 |{'query_string':'beer', 'word_in_list':true, 'content':['beer', 'beerier', 'beeriest', 'beers', 'beery']}|
    | xrfg | starts-with | 200 |{'query_string':'xrfg', 'word_in_list':false, 'content':[]}|
    | beer | ends-with | 200 |{'query_string':'beer', 'word_in_list':true, 'content':['ambeer', 'beer']}|
    | xrfg | ends-with | 200 |{'query_string':'xrfg', 'word_in_list':false, 'content':[]}|
    | beer | contains | 200 |{'query_string':'beer', 'word_in_list':true, 'content':['ambeer', 'ambeers', 'bebeeru', 'bebeerus', 'beer', 'beerier', 'beeriest', 'beers', 'beery']}|
    | xrfg | contains | 200 |{'query_string':'xrfg', 'word_in_list':false, 'content':[]}|
    
    