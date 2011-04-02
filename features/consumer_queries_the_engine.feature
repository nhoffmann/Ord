Feature: consumer queries the engine

  As a consumer
  I want to query the engine
  So that I get a list of words
  
  Scenario Outline: query for words containing the query string
    Given the engine is loaded with "<word_list>"
    When I query it with "<query_string>"
    Then The output should be "<result>"

    Scenarios: no matches
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | a | false |
      
    Scenarios: one exact match
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | Aaaa | true |
          
    
  Scenario Outline: query for words starting with the query string
    Given the engine is loaded with "<word_list>"
    When I query it for words starting with "<query_string>"
    Then The output should contain "<result>"
    
    Scenarios: no matches
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | a ||
      
    Scenarios: one match
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | Aa | Aaaa |
        
  Scenario Outline: query for words ending with the query string
    Given the engine is loaded with "<word_list>"
    When I query it for words ending with "<query_string>"
    Then The output should contain "<result>"
    
    Scenarios: no matches
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | z ||
      
    Scenarios: match one character
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | a | Aaaa |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | u | simbu |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | d | Dddd dddd |
      
    Scenarios: matches multiple character
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | aa | Aaaa |
  
  Scenario Outline: query for words that contain the query string
    Given the engine is loaded with "<word_list>"
    When I query it for words containing the "<query_string>"
    Then The output should contain "<result>"
    
    Scenarios: no matches
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | zz ||
      
    Scenarios: one match
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | imb | simbu |
      
  Scenario Outline: query for words that are an anagram of the query string
    Given the engine is loaded with "<word_list>"
    When I query it for anagrams of "<query_string>"
    Then The output should contain "<result>"

    Scenarios: no matches
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | a ||

    Scenarios: one match
      | word_list | query_string | result |
      | Aaaa Bbbbb Cccc CCCC  cccc Dddd dddd eeeeeee argo simbu | Aaaa | Aaaa |

