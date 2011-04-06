require 'spec_helper'

module Ord
  describe "App" do
    include Rack::Test::Methods

    def app
      @app ||= Ord::App
    end
    
    shared_examples_for "any endpoint" do
      it "responds to the query" do
        get @query
        last_response.should be_ok
      end
      
      it "returns json that can be parsed to a hash" do
        get @query
        parse_response
      end
    end
    
    
    describe "# GET /word/<word>" do
      before(:each) do
        @query = '/word/beer'
      end
      it_behaves_like "any endpoint"
    end
    
    describe "# GET /starts-with/<word>" do
      before(:each) do
        @query = '/starts-with/beer'
      end
      it_behaves_like "any endpoint"
    end
      
    describe "# GET /ends-with/<word>" do
      before(:each) do
        @query = '/ends-with/beer'
      end
      it_behaves_like "any endpoint"
    end
    
    describe "# GET /contains/<word>" do
      before(:each) do
        @query = '/contains/beer'
      end
      it_behaves_like "any endpoint"
    end
    
  end
end