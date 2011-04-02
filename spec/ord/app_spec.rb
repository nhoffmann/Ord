require 'spec_helper'

module Ord
  describe "App" do
    include Rack::Test::Methods

    def app
      @app ||= Ord::App
    end
    
    describe "# GET /" do
      it "returns a usage message" do
        get '/'
        last_response.should be_ok
      end
    end
    
    describe "# GET /word/<word>" do
      it "responds to /word/<query>" do
        get '/word/beer'
        last_response.should be_ok
      end

      it "returns a status of 200 if word is in list" do
        get '/word/beer'
        status_is 200
      end
      
      it "returns a status of 404 if word is not in list" do
        get '/word/reeb'
        status_is 404
      end
    end
    
    describe "# GET /starts-with/<word>" do
      it "responds to /starts-with/<query>" do
        get '/starts-with/beer'
        last_response.should be_ok
      end
      
      it "returns a status of 200 if words could be found" do
        get '/starts-with/beer'
        status_is 200
      end
      
      it "returns a status of 404 if no words could be found" do
        get '/starts-with/there_will_be_no_single_word_that_starts_with_in_the_word_list'
        status_is 404
      end
      
      it "returns a response body that is not empty if words could be found" do
        get '/starts-with/beer'
        last_response.body.should_not be_empty
      end
      
      it "returns a response body that is in json format and can be parsed to an array" do
        get '/starts-with/beer'
        body_holds_array
      end
    end
      
    describe "# GET /ends-with/<word>" do
      it "responds to /ends-with/<query>" do
        get '/ends-with/beer'
        last_response.should be_ok
      end

      it "returns a status of 200 if words could be found" do
        get '/ends-with/beer'
        status_is 200
      end

      it "returns a status of 404 if no words could be found" do
        get '/ends-with/there_will_be_no_single_word_that_starts_with_in_the_word_list'
        status_is 404
      end

      it "returns a response body that is not empty if words could be found" do
        get '/ends-with/beer'
        last_response.body.should_not be_empty
      end

      it "returns a response body that is in json format and can be parsed to an array" do
        get '/ends-with/beer'
        body_holds_array
      end
    end
    
    describe "# GET /contains/<word>" do
      it "responds to /contains/<query>" do
        get '/contains/beer'
        last_response.should be_ok
      end

      it "returns a status of 200 if words could be found" do
        get '/contains/beer'
        status_is 200
      end

      it "returns a status of 404 if no words could be found" do
        get '/contains/there_will_be_no_single_word_that_starts_with_in_the_word_list'
        status_is 404
      end

      it "returns a response body that is not empty if words could be found" do
        get '/contains/beer'
        last_response.body.should_not be_empty
      end

      it "returns a response body that is in json format and can be parsed to an array" do
        get '/contains/beer'
        body_holds_array
      end
    end
    
  end
end