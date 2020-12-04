class Greeting
  def greeting(message)
    puts message
  end
end

class Hi < Greeting
  def hi
    greeting("Hello")
  end
end

class Bye < Greeting
  def bye
    greeting("Goodbye")
  end
end

mes = Hi.new
mes.hi