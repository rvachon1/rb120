module Promptable
  def prompt(message)
    puts "==> #{message}"
  end

  def prompt_oneline(message)
    print "==> #{message}"
  end

  def empty_line
    puts "\n"
  end

  def clear
    system "clear"
  end
end