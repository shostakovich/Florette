class PHPCreater
  def initialize(nodes)
    @nodes = nodes
  end

  def create
    @code = ""
    open_php_tag
    process_block(@nodes)
    close_php_tag
    @code
  end

  private

  def open_php_tag
    @code += "<?php\n"
  end

  def process_block(block)
    block.nodes.each do |node|
      if node.instance_of? IfNode
        return process_if_node(node)
      end

      @code += "\n#{node.identifier}();"
    end
  end

  def process_if_node(if_node)
    @code += "if (#{if_node.condition.value})\n{"
    process_block(if_node.block.nodes[0])
    @code += "\n}"
  end

  def close_php_tag
    @code += "\n?>"
  end
end