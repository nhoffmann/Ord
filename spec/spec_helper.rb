require 'ord'
require 'sinatra'
require 'rack/test'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false


def status_is(status)
  last_response.status.should == status
end

def parse_response
  JSON.parse last_response.body
end