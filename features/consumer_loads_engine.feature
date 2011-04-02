Feature: consumer loads engine

  As a consumer
  I want to load the engine
  So that I can query it
          
  Scenario Outline: load engine with string
    Given I have an engine
    When I load the engine with the words "<word_list>"
    Then I should be able to query it 
    And the engine should have <number_of_words> in it
    
    Examples:
    | word_list | number_of_words |
    | Test| 1 |
    | Test Word | 2 |
    | Even More Words | 3 |