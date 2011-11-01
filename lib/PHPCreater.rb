class PHPCreater
  def initialize(nodes)
    @nodes = nodes
  end

  def create
    @code = ""
    open_php_tag
    process_nodes
    close_php_tag
    @code
  end

  def process_nodes
    @nodes.nodes.each do |node|
      @code += "\n#{node.identifier}();"
    end
  end

  def open_php_tag
    @code += "<?php\n"
  end

  def close_php_tag
    @code += "\n?>"
  end
end