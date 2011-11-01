require "rspec"
require "Nodes"

describe "Nodes" do

  it "should expose nodes inside" do
    nodes = Nodes.new "nodes"
    nodes.nodes.should eql("nodes")
  end
end