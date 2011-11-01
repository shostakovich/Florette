class Parser

# Tokens produced by lexer
token IF
token NUMBER
token INDENT DEDENT
token STRING
token NEWLINE
token IDENTIFIER

expect 3

rule
  Root:
    /* nothing */                      { result = Nodes.new([]) }
  | Expressions                        { result = val[0] }
  ;

  # Any list of expressions, separated by line breaks.
  Expressions:
    Expression                         { result = Nodes.new(val) }
  | Expressions Terminator Expression  { result = val[0] << val[2] }
    # To ignore trailing line breaks
  | Expressions Terminator             { result = Nodes.new([val[0]]) }
  ;

  # All types of expressions in our language
  Expression:
    Literal
  | Call
  | If
  ;

  # All tokens that can terminate an expression
  Terminator:
    NEWLINE
  | ";"
  ;

  # All hard-coded values
  Literal:
    NUMBER                        { result = LiteralNode.new(val[0]) }
  | STRING                        { result = LiteralNode.new(val[0]) }
  ;

  # A function call
  Call:
    IDENTIFIER                    { result = CallNode.new(val[0]) }
  ;

  If:
    IF Expression Block           { result = IfNode.new(val[1], val[2]) }
  ;

  Block:
    INDENT Expressions DEDENT     { result = val[1] }
  ;
end


---- header
  require "lexer"
  require "nodes"
  require "LiteralNode"
  require "IfNode"
  require "CallNode"

---- inner
  def parse(code, show_tokens=false)
    @tokens = Lexer.new.tokenize(code)
    puts @tokens.inspect if show_tokens
    do_parse
  end

  def next_token
    @tokens.shift
  end