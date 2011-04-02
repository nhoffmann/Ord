def engine
  @engine ||= Ord::Engine.instance
end

Given /^I have an engine$/ do
  engine
end

When /^I load the engine with the words "([^"]*)"$/ do | word_list |
  engine.load_string(word_list, " ")
end

Then /^I should be able to query it$/ do
  engine.running?
end


Then /^the engine should have (\d+) in it$/ do | number_of_words |
  engine.size == number_of_words
end

Given /^the engine is loaded with "([^"]*)"$/ do |word_list|
  engine.load_string(word_list, " ")
end

When /^I query it with "([^"]*)"$/ do | query_string |
  @result = engine.word query_string
end

When /^I query it for words starting with "([^"]*)"$/ do |query_string|
  @result = engine.starts_with query_string
end

When /^I query it for words ending with "([^"]*)"$/ do |query_string|
  @result = engine.ends_with query_string
end

When /^I query it for words containing the "([^"]*)"$/ do |query_string|
  @result = engine.contains query_string
end


When /^I query it for anagrams of "([^"]*)"$/ do |query_string|
  pending # express the regexp above with the code you wish you had
end

Then /^The output should be "([^"]*)"$/ do | result |
  @result == result
end


Then /^The output should contain "([^"]*)"$/ do |result|
  result.each(" ") do | word |
    @result.should include(word.strip)
  end
end

