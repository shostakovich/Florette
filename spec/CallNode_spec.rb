require "rspec"
require "CallNode"

describe "CallNode" do

  it "should be able to only take a identifier" do
    node = CallNode.new("Foobar")
    node.identifier.should eql("Foobar")
  end
end