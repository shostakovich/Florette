require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Parser" do
  let(:parser) {Parser.new }

  it "empty string should have main node" do
    parser.parse("").nodes().length.should eql(0)
  end
end
