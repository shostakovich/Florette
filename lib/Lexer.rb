class Lexer
  def tokenize(code)
    @tokens = []
    code.split(/ /).each{|chunk| tokenize_single_bit(chunk)}
    return @tokens
  end

  def tokenize_single_bit(chunk)
    if chunk == "if"
      @tokens << [:IF, "if"]
    elsif chunk.match /[0-9]+/
      @tokens << [:NUMBER, chunk.to_i]
    end
  end
end