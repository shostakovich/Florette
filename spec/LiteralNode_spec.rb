require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'LiteralNode'

describe "LiteralNode" do
  it "can be initialized with a number" do
    node = LiteralNode.new(1)
    node.value.should eql(1)
  end
end