module Verifiable
  include Promptable

  def verify(message, options)
    choice = ""
    loop do
      prompt(message)
      choice = gets.chomp
      break if options.include?(choice.downcase)
    end
    choice
  end
end