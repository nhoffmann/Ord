Given /^I send and accept JSON$/ do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
end

Given /^the searched word is "([^"]*)"$/ do | word |
  @word = word
end

When /^I send a GET request with "([^"]*)"$/ do | method |
  get "#{method}/#{@word}"
end

Then /^the status should be "([^"]*)"$/ do | status |
  last_response.status.should == status.to_i
end

Then /^the returned content type should be json$/ do
  last_response.headers['Content-Type'].should include('application/json')
end

Then /^the body should contain "([^"]*)"$/ do | word |
  body = last_response.body
  unless body.empty?
    json = JSON.parse last_response.body
    json.should include(word)
  end
end

Then /^the body should return json that equals this "([^"]*)"$/ do |expected_json|
  expected = JSON.parse(expected_json.gsub!('\'', '"'))
  actual   = JSON.parse(last_response.body)
  actual.should == expected
end


Then /^the output should be of type Hash$/ do
  body = last_response.body
  json = JSON.parse body
  json.class.should == Hash
end


