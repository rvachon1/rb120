module Verifiable
  include Promptable

  def verify(message, options)
    choice = ""
    loop do
      prompt(message)
      choice = gets.chomp
      result = options.include?(choice.downcase)
      break if result == true
      prompt("Invalid Response.")
    end
    choice
  end
end