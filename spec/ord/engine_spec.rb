require 'spec_helper'

module Ord
  describe Engine do
    let(:output) {double('output').as_null_object}
    let(:engine) {Engine.instance }
    
    describe "#load_string" do
      it "fills the word_list from a string expecting the words to be separated by a delimiter" do
        engine.load_string("One Two Three", " ")
        engine.size.should == 3
      end
    end
    
    describe "#load_file" do
      it "fills the word_list from a file expecting one word per line" do
        engine.load_file("public/test.txt")
        engine.size.should == 3
      end
    end
    
    describe "#word" do
      it "returns true if the given word is in the list" do
        engine.load_string("One Two Three", " ")
        result = engine.word('One')
        result.should be_true
      end
      it "returns false if the given word is not in the list" do
        engine.load_string("One Two Three", " ")
        result = engine.word('Ten')
        result.should be_false
      end
    end
    
    describe "#starts_with" do
      it "returns words starting with a given query string" do
        engine.load_string("One Two Three", " ")
        output.should include('One')
        engine.starts_with('O')
      end
    end
    
    describe "#ends_with" do
      it "returns words ending with a given query string" do
        engine.load_file("public/en.txt")
        output.should include('One')
        engine.ends_with('one')    
      end
    end
  end
end