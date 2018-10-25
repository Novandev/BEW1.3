
# This enumerator will take an array and turn its elements into an Enumerator

require "HTTParty"

sampleArray = %w(First Second Third Forth Fifth)

enumeratorExample = Enumerator.new do |yielder|
  # for each element in the sample array
  sampleArray.each do |elem|
    yielder << elem
  end

end

puts enumeratorExample.next  # This should First

puts enumeratorExample.next  # This should Second

puts enumeratorExample.next  # This should Third

# An easier way to do this to use the method to_enum to transform an array into the Enumerable type

array = [1, 2, 3]
anotherEnumerator = array.to_enum
puts "anotherEnumerator is an " + anotherEnumerator.class.to_s

# Just to prove this does the exact same

puts anotherEnumerator.next

# Lets do some work on a few data structures to drive this home


