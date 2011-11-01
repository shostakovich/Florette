require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Lexer" do
  let(:lexer) {Lexer.new }

  it "returns an empty error for an empty string" do
    lexer.tokenize("").should eql([])
  end

  it "can parse keywords" do
    lexer.tokenize("if").should eql([[:IF, "if"]])
  end

  it "can parse identifiers" do
    lexer.tokenize("pass").should eql([[:IDENTIFIER, "pass"]])
    lexer.tokenize("false").should eql([[:IDENTIFIER, "false"]])
  end

  it "can parse a number" do
    lexer.tokenize("45464").should eql([[:NUMBER, 45464]])
  end

  it "can parse a string" do
    lexer.tokenize("\"hello\"").should eql([[:STRING, "hello"]])
  end

  it "can parse newlines" do
    lexer.tokenize("1

1").should eql([[:NUMBER, 1],[:NEWLINE, "\n"],[:NUMBER, 1]])
  end

  it "can parse an indentation" do
     code =
'if 1:
  1'
    lexer.tokenize(code).should eql([[:IF, "if"],[:NUMBER, 1],[:INDENT, 2],[:NUMBER, 1]])
  end

  it "can parse a dedentation" do
     code =
'if 1:
  1
1'
    lexer.tokenize(code).should eql(
       [[:IF, "if"],[:NUMBER, 1],[:INDENT, 2],[:NUMBER, 1],[:DEDENT, 0], [:NUMBER, 1]])
  end
end