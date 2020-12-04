def random_method
  puts "randmon string"
end

begin
  puts "Begin Branch"
  raise ZeroDivisionError
rescue => e
  puts e.backtrace
  puts $!
else
  puts "Else Branch"
ensure
  puts "Ensure Branch"
end