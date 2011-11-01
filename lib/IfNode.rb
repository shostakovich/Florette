class IfNode
  attr_accessor :condition, :block

  def initialize(condition, block)
    @condition = condition
    @block = block
  end
end