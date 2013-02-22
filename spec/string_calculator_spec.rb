$LOAD_PATH << File.expand_path(File.dirname(__FILE__) + "/../app/model")
require 'rubygems'
require 'string_calculator'

describe StringCalculator do
  before :all do
    
  end
  
  context "#add" do
    it "should return 0 for an empty string" do
      StringCalculator.add("").should == 0
    end

    it "should return 1 for '1'" do
      StringCalculator.add("1").should == 1
    end

    it "should accept a string of numbers" do
      StringCalculator.add("1, 2, 3,4").should == 10
    end

    it "should allow any delimiter between numbers" do
      StringCalculator.add("//|\n1|2|3|4").should == 10
    end
    
    it "should throw an exception on adding negative numbers" do
      expect {StringCalculator.add("1, -1, 2, -2")}.to raise_error(NegativeNumbersNotAllowed, /\[-1, -2\]/)
    end

    it "should throw an exception on adding large-ish numbers" do
      expect {StringCalculator.add("1, 1001, 2, 1002")}.to raise_error(LargeNumbersNotAllowed, /\[1001, 1002\]/)
    end

  end
  
  describe "parse_delimiter" do
    it "should parse a delimiter when present" do
      StringCalculator.parse_delimiter("//|\n1|2|3|4").should == "|"
    end 
    it "should not parse a delimiter when not present" do
      StringCalculator.parse_delimiter("1,2,3,4").should == nil
    end
  end
  
  
  after :all do
  end
  
end

