class EmptyStackError < StandardError
end

class InvalidTokenError < StandardError
end

class NoPrintError < StandardError
end

class Minilang
  VALID_COMMANDS = %w(PUSH POP ADD SUB MULT DIV MOD PRINT)
  def initialize(string)
    @commands = string.split(" ")
    @reg = 0
    @stack = Array.new
  end

  def eval
    puts "---START OF COMMANDS---"
    @commands.each do |command|
      case command
      when "PUSH" then push
      when "POP" then pop
      when "ADD" then add
      when "SUB" then sub_c
      when "MULT" then mult
      when "DIV" then div
      when "MOD" then mod
      when "PRINT" then print_c
      else
        n_or_unexpected(command)
      end
      rescue => e
        warn e.message
        break
    end
    raise NoPrintError, "nothing printed; No PRINT command" if !@commands.include?("PRINT")
    puts "---END OF COMMANDS---"
    rescue => e
      warn e.message
  end

  private

  def push
    @stack.push(@reg)
  end

  def pop
    raise EmptyStackError, "Empty Stack!" if @stack.empty?
    @reg = @stack.pop
  end

  def add
    @reg = @stack.pop + @reg
  end

  def sub_c
    @reg = @stack.pop - @reg
  end

  def mult
    @reg = @stack.pop * @reg
  end

  def div
    @reg = @reg / @stack.pop
  end

  def mod
    @reg = @reg % @stack.pop
  end

  def print_c
    puts(@reg)
  end

  def int(num)
    @reg = num.to_i
  end

  def n_or_unexpected(command)
    if command.to_i.to_s == command
      int(command)
    else
      raise InvalidTokenError, "Invalid Token: #{command}"
    end
  end
end

Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)