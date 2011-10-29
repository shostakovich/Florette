require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Lexer" do
  let(:lexer) {Lexer.new }

  it "returns an empty error for an empty string" do
    lexer.tokenize("").should eql([])
  end

  it "can parse an if" do
    lexer.tokenize("if").should eql([[:IF, "if"]])
  end

  it "can parse a number" do
    lexer.tokenize("1").should eql([[:NUMBER, 1]])
    lexer.tokenize("45464").should eql([[:NUMBER, 45464]])
  end

  it "can parse multiple tokens" do
    lexer.tokenize("if 1").should eql([[:IF, "if"],[:NUMBER, 1]])
  end
end