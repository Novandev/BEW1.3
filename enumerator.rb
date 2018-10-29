
# ---------- This enumerator will take an array and turn its elements into an Enumerator ----------#


# ---------- Lets require some of out installed gems ----------#

require "HTTParty"
require "json"




sampleArray = %w(First Second Third Forth Fifth)

enumeratorExample = Enumerator.new do |yielder|
  # for each element in the sample array
  sampleArray.each do |elem|
    yielder << elem   # Place the value into a yielder for iteration
  end

end

# puts enumeratorExample.next  # This should First

# puts enumeratorExample.next  # This should Second

# puts enumeratorExample.next  # This should Third




# --------- An easier way to do this to use the method to_enum to transform an array into the Enumerable type ------------#

array = [1, 2, 3]
anotherEnumerator = array.to_enum

# puts "anotherEnumerator is an " + anotherEnumerator.class.to_s

# ----------- Just to prove this does the exact same ----------#

# puts anotherEnumerator.next






#---------- Lets do some work on a few data structures to drive this home ----------#

response =
    HTTParty.get("https://wakatime.com/share/@novandev/20a85168-7fd4-404e-92aa-d875abfab254.json")


responseObject =JSON.parse(response.body)     # This will turn it into a ruby hash

responseEnunerator = responseObject['data'].to_enum     # Transform it into an enum

# puts responseEnunerator     # Puts the entire json file into a ruby hash

# puts responseEnunerator.next    # Will just print the first
