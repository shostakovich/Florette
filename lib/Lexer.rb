class Lexer
  def initialize
    @prev_indentation = 0
  end

  def tokenize(code)
    @tokens = []
    code.each_line {|l| parse_single_line(l)}
    @tokens
  end

  def parse_single_line(line)
    check_newline(line)
    process_indentation(line)
    line.split(/ /).each{|chunk| tokenize_single_bit(chunk)}
  end

  def check_newline(line)
    if /^[\n]+/.match(line)
      @tokens << [:NEWLINE, "\n"]
    end
  end

  def process_indentation(line)
    line_indentation = 0

    if leading_whitespace = /^([ ]+)/.match(line)
      line_indentation = leading_whitespace.length
      @tokens << [:INDENT, line_indentation - @prev_indentation] if line_indentation > @prev_indentation
      @prev_indentation = line_indentation
    end

    @tokens << [:DEDENT, @prev_indentation - line_indentation] if line_indentation < @prev_indentation
  end

  def tokenize_single_bit(chunk)
    if /if/.match(chunk)
      @tokens << [:IF, "if"]
    elsif /[0-9]+/.match(chunk)
      @tokens << [:NUMBER, chunk.to_i]
    elsif string = /\"(.*)\"/.match(chunk)
      @tokens << [:STRING, string[1]]
    end
  end
end