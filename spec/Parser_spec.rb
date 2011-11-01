require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "Parser"

describe "Parser" do
  let(:parser) {Parser.new }

  it "empty string should have main node" do
    parser.parse("")
  end

  it "parses a literal node" do
    parser.parse("1")
  end

  it "parses an if statement do" do
    parser.parse("echo")
  end
end
