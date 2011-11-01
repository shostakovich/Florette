require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'IfNode'
require 'LiteralNode'
require 'Nodes'

describe "IfNode" do
  it "takes a condition and a block" do
    condition = LiteralNode.new(1)
    block = Nodes.new([LiteralNode.new(1)])
    node = IfNode.new(condition, block)

    node.block.should eql(block)
    node.condition.should eql(condition)
  end
end