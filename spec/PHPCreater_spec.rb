require "rspec"
require "PHPCreater"
require "Nodes"
require "CallNode"

describe "PHPCreater" do
  it "should be initialized with nodes" do
    nodes = Nodes.new "foo"
    PHPCreater.new(nodes)
  end

  context "create" do
    it "should generate prepend <?php" do
      nodes = Nodes.new []
      creater = PHPCreater.new(nodes)
      creater.create.should match(/^<\?php/)
    end

    it "should append ?>" do
      nodes = Nodes.new []
      creater = PHPCreater.new(nodes)
      creater.create.should match(/\?>/)
    end

    it "should return a php function call for a simple call node" do
       nodes = Nodes.new([CallNode.new("exit")])

       creater = PHPCreater.new(nodes)
       creater.create.should match /^exit\(\);$/
    end

    it "should handle multiple function calls" do
       nodes = Nodes.new([CallNode.new("exit"), CallNode.new("phpinfo")])

       creater = PHPCreater.new(nodes)
       creater.create.should match /^exit\(\);$/
       creater.create.should match /^phpinfo\(\);$/
    end
  end
end